//
//  NSMutableDictionary+DDUtility.m
//  DDUtility
//
//  Created by Oliver Jones on 2/02/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import "NSMutableDictionary+DDUtility.h"


@implementation NSMutableDictionary (DDUtility)

/////////////////////////////////////////////////////////////////////////////////////////////////
- (NSDictionary*) readonlyCopy
{
    return [[NSDictionary alloc] initWithDictionary: self];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (void) setObject: (id) anObject 
    forUIntegerKey: (NSUInteger) aKey
{
    NSNumber* number = [NSNumber numberWithUnsignedInteger: aKey];
    [self setObject: anObject forKey: number];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (void) setObject: (id) anObject 
    forIntegerKey: (NSInteger) aKey
{
    NSNumber* number = [NSNumber numberWithInteger:aKey];
    [self setObject: anObject forKey: number];
}

@end
