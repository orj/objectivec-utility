//
//  DDCarouselImageLayer.h
//  DDUtility
//
//  Created by Oliver Jones on 14/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface DDCarouselImageLayer : CALayer {
    float m_carouselAngle;    
}

@property (assign, nonatomic) float carouselAngle;

@end
