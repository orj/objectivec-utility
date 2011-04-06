//
//  DDCarouselImageLayer.m
//  DDUtility
//
//  Created by Oliver Jones on 31/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import "DDCarouselImageLayer.h"
#import "DDMathUtil.h"

static NSString* kRotationPropertyKey = @"rotation";

@interface DDCarouselImageLayer ()

/*!
 @abstract  Get the image for the specified rotation (in radians).
 */
- (UIImage*) imageForRotation:(CGFloat)rotation;

@end

@implementation DDCarouselImageLayer

@synthesize rotation = m_rotation;
@synthesize images;

/////////////////////////////////////////////////////////////////////////////////////////////////
- (void) setRotation:(CGFloat)rotation
{
    [self willChangeValueForKey:kRotationPropertyKey];
    m_rotation = rotation;
    [self didChangeValueForKey:kRotationPropertyKey];
    
    [self setNeedsDisplay];
}

#pragma mark -
#pragma mark Class methods

/////////////////////////////////////////////////////////////////////////////////////////////////
+ (BOOL)needsDisplayForKey:(NSString*)key 
{
    // To force animation when our custom properties change
    if ([key isEqualToString:kRotationPropertyKey])
    {
        return YES;
    }
    
    return [super needsDisplayForKey:key];
}

#pragma mark -
#pragma mark Instance methods

/////////////////////////////////////////////////////////////////////////////////////////////////
- (id) init
{
    if ((self = [super init]))
    {
        [self setNeedsDisplay];
    }
    
    return self;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithLayer:(id)layer 
{
	if ((self = [super initWithLayer:layer])) 
    {
		if ([layer isKindOfClass:[DDCarouselImageLayer class]])
        {
            DDCarouselImageLayer *other = (DDCarouselImageLayer*)layer;
            self.images = other.images;
			self.rotation = other.rotation;
		}
	}
    
	return self;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc 
{
    self.images = nil;
    
    [super dealloc];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (void) drawInContext:(CGContextRef)ctx
{
    UIImage* newImg = [self imageForRotation:self.rotation];
    UIGraphicsPushContext(ctx);
    [newImg drawInRect:self.bounds];
    UIGraphicsPopContext();
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (UIImage*) imageForRotation:(CGFloat)rotation
{
    const float TWOPI = 2*M_PI;
    
    NSUInteger imageCount = [self.images count];
    if (imageCount > 0)
    {
        CGFloat radiansPerImage = TWOPI / imageCount;
        CGFloat rotation = [DDMathUtil constrainFloatValue:self.rotation betweenMin:0.0f max:TWOPI];

        NSUInteger imageIndex = ((NSUInteger) floorf(rotation / radiansPerImage)) % imageCount;
    
        return [self.images objectAtIndex:imageIndex];
    }
    
    return nil;
}

@end
