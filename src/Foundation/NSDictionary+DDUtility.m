//
//  NSDictionary+Helper.m
//  GSPA
//
//  Created by Oliver Jones on 2/02/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import "NSDictionary+DDUtility.h"


@implementation NSDictionary (DDUtility)

/////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*) stringForKey: (id) aKey
{
    id o = [self objectForKey: aKey];

    NSAssert([o isKindOfClass: [NSString class]], @"Not a string!");
    
    return (NSString*) o;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (id) objectForUIntegerKey: (NSUInteger) aKey
{
    NSNumber* number = [NSNumber numberWithUnsignedInteger: aKey];
    return [self objectForKey: number];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (id) objectForIntegerKey: (NSInteger) aKey
{
    NSNumber* number = [NSNumber numberWithInteger: aKey];
    return [self objectForKey: number];
}

@end
