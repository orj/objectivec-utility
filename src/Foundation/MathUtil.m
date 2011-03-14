//
//  MathUtil.m
//  DDUtility
//
//  Created by Oliver Jones on 14/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import "MathUtil.h"

@implementation MathUtil

/////////////////////////////////////////////////////////////////////////////////////////////////
+ (float) clampFloatValue:(float)val 
               betweenMin:(float)minval 
                      max:(float)maxval
{
    return MAX(MIN(val, maxval), minval);
}

/////////////////////////////////////////////////////////////////////////////////////////////////
+ (float) constrainFloatValue:(float)val 
                   betweenMin:(float)minval 
                          max:(float)maxval
{    
    // FIXME: this is not correct.
    return fmodf(val, maxval);
}

@end