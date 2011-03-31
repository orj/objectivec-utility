//
//  DDCarouselImageLayer.h
//  DDUtility
//
//  Created by Oliver Jones on 31/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>


@interface DDCarouselImageLayer : CALayer 
{
@private
    float m_rotation;
    NSArray* m_images;
}

/*!
 @abstract  The rotation of the carousel in radians (360 degrees is 2*M_PI when measured in radians)
 */
@property (assign, nonatomic) CGFloat rotation;

/*!
 @abstract  The images to show in the carousel.
 */
@property (retain, nonatomic) NSArray* images;

@end
