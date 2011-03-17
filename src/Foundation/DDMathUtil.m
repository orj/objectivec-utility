//
//  MathUtil.m
//  DDUtility
//
//  Created by Oliver Jones on 14/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import "DDMathUtil.h"

@implementation DDMathUtil

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
    double x = val;
    double lo = minval;
    double hi = maxval;
    
    double t = (x-lo) / (hi-lo);
    return (float) (lo + (hi-lo) * (t-floor(t)));
}

@end