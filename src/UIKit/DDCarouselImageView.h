//
//  DDCarouselImageView.h
//  CarouselDemo
//
//  Created by Oliver Jones on 14/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DDCarouselImageView : UIView 
{
@private
    CGPoint m_lastTranslation;
}

/*!
 @abstract      The duration of a carousel throw.  Defaults to 2 seconds.
 */
@property (assign, nonatomic) CGFloat throwDuration;

/*!
 @abstract      A factor to multiply the throw velocity with.  
 Values higher than one increase velocity; lower values decrease velocity.
 Defaults to 0.5.
 */
@property (assign, nonatomic) CGFloat throwVelocityFactor;

/*!
 @abstract      The minimum velocity (in radians per second) a throw must exceed in order to spin the carousel.
 Default is 5 degrees per second (as measured in radians).
 */
@property (assign, nonatomic) CGFloat minimumThrowVelocity;

/*!
 @abstract      Create an image carousel with the specified images.
 @param         images      The images are expected to be in order so that they animate the object 
                            clockwise for positive spin velocity/angle.
 */
+ (DDCarouselImageView*) carouselWithImages:(NSArray*)images;


- (id) initWithImages:(NSArray*)images;

/*!
 @abstract      Spin the carousel with the specified velocity.
 @param         velocity    The velocity of the spin (measured in radians per second).
 @param         duration    The duration of the spin.
 */
- (void) spinWithVelocity:(CGFloat)velocity 
              forDuration:(CGFloat)duration;

/*!
 @abstract      Stop the Carousel's spin animation (if active).
 */
- (void) stopSpin;


@end
