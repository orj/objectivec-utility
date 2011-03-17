//
//  NSObject+DDUtility.m
//  DDUtility
//
//  Created by Oliver Jones on 17/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import "NSObject+DDUtility.h"


@implementation NSObject (DDUtility)

/////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL) isNotEqual: (id) anObject
{
    return [self isEqual: anObject] == NO;
}

@end
