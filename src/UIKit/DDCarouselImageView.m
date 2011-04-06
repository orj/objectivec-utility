//
//  DDCarouselImageView.m
//  CarouselDemo
//
//  Created by Oliver Jones on 14/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import "DDCarouselImageView.h"
#import "DDCarouselImageLayer.h"

#pragma mark -
#pragma mark Private Interface

static NSString* kThrowAnimationKey = @"DDCarouselImageView_throwAnimation";

@interface DDCarouselImageView ()
- (void) spinCarousel:(id)sender;
- (CGFloat) rotationForTranslation:(CGFloat)horizontalTranslation;

@property (readonly, nonatomic) DDCarouselImageLayer* carouselLayer;
@property (readonly, nonatomic) CGFloat currentRotation;

@end

@implementation DDCarouselImageView

@synthesize throwDuration;
@synthesize throwVelocityFactor;
@synthesize minimumThrowVelocity;

#pragma mark -
#pragma Class Methods

/////////////////////////////////////////////////////////////////////////////////////////////////
+ (DDCarouselImageView*) carouselWithImages:(NSArray*)images
{
    return [[[DDCarouselImageView alloc] initWithImages:images] autorelease];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
+ (Class)layerClass
{
    return [DDCarouselImageLayer class];
}

#pragma mark -
#pragma mark Instance Methods

/////////////////////////////////////////////////////////////////////////////////////////////////
- (DDCarouselImageLayer*) carouselLayer
{
    return (DDCarouselImageLayer*)self.layer;
}

- (CGFloat) currentRotation
{
    return ((DDCarouselImageLayer*)self.layer.presentationLayer).rotation;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
-(id) initWithImages:(NSArray*)images
{
    UIImage* startImage = [images objectAtIndex: 0];
    CGRect imageFrame = CGRectMake(0, 0, startImage.size.width, startImage.size.height);
    
    if ((self = [super initWithFrame:imageFrame]))
    {
        self.throwVelocityFactor = 0.5f;
        self.throwDuration = 2.0f;
        self.minimumThrowVelocity = 5.0/(180.0/M_PI);
        
        self.carouselLayer.images = images;
        self.carouselLayer.rotation = 0;
        
        self.userInteractionEnabled = YES;
        
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(spinCarousel:)];
        [self addGestureRecognizer: panGestureRecognizer];
        [panGestureRecognizer release];
    }

    return self;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (void) spinCarousel:(UIPanGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        m_lastTranslation = CGPointMake(0, 0);
        [self stopSpin];
    }
    else if (gesture.state == UIGestureRecognizerStateChanged)
    {
        CGPoint translation = [gesture translationInView:self];
        CGFloat translationSinceLastChange = translation.x - m_lastTranslation.x;
        m_lastTranslation = translation;
        
        CGFloat rotation = [self rotationForTranslation:-translationSinceLastChange];
        CGFloat newRotation = self.currentRotation + rotation;
        self.carouselLayer.rotation = newRotation;
    }
    else if (gesture.state == UIGestureRecognizerStateEnded)
    {
        CGPoint vel = [gesture velocityInView:self];
        if (fabs(vel.x) >= self.minimumThrowVelocity)
        {
            [self spinWithVelocity:((-vel.x * self.throwVelocityFactor)/(180.0f/M_PI)) forDuration: 1.0f];
        }
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (void) stopSpin
{
    self.carouselLayer.rotation = self.currentRotation;
    
    [self.layer removeAnimationForKey:kThrowAnimationKey];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (void) spinWithVelocity:(CGFloat)velocity forDuration: (CGFloat)duration
{
    // stop any current spin animation before starting another.
    [self stopSpin];
    
    // Just use the velocity as the target translation/rotation value.
    CGFloat targetRotation = self.currentRotation + (velocity * duration);
    
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"rotation"];
    animation.fromValue = [self.carouselLayer valueForKey:@"rotation"];
    animation.toValue = [NSNumber numberWithFloat:targetRotation];
    animation.duration = duration;
    animation.removedOnCompletion = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.layer addAnimation:animation forKey:kThrowAnimationKey];
    
    // The carousel's end rotation should be the target rotation.
    self.carouselLayer.rotation = targetRotation;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self stopSpin];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat) rotationForTranslation:(CGFloat)horizontalTranslation
{
    CGFloat radiansPerPoint = M_PI / self.frame.size.width;
    return horizontalTranslation * radiansPerPoint;
}

@end
