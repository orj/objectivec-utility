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
- (id) objectForKey: (id) aKey default: (id) aDefault
{
    id o = [self objectForKey: aKey];
    return o != nil ? o : aDefault;   
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*) stringForKey: (id) aKey
{
    id o = [self objectForKey: aKey];
    return (NSString*) o;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL) booleanForKey: (NSString*) aKey default: (BOOL) aDefault;
{
    NSNumber* o = [self valueForKey: aKey];
    return o != nil ? [o boolValue] : aDefault;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL) booleanForKey: (NSString*) aKey
{
    return [self booleanForKey: aKey default: NO];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (float) floatForKey: (NSString*) aKey
{
    return [self floatForKey: aKey default: 0.0f];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (float) floatForKey: (NSString*) aKey default: (float) aDefault
{
    NSNumber* o = [self valueForKey: aKey];
    return o != nil ? [o floatValue] : aDefault;
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
