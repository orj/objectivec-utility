//
//  MathUtil.h
//  DDUtility
//
//  Created by Oliver Jones on 14/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MathUtil : NSObject
{
}

/*!
 @abstract      Clamp a value within an inclusive range.
 */
+ (float) clampFloatValue:(float)val 
               betweenMin:(float)minval 
                      max:(float)maxval;


/*!
 @abstract      Constrain a value within an inclusive lower bound and an exclusive upper bound.
                Ie, in interval notation: [minval, maxval).  Values outside the range will cycle 
                back around into the range.  Eg: given a minval 0, maxval 10 and val 15 will result in 5 being returned.
 */
+ (float) constrainFloatValue:(float)val 
                   betweenMin:(float)minval 
                          max:(float)maxval;


@end


