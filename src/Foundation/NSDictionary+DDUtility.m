//
//  NSDictionary+Helper.m
//  GSPA
//
//  Created by Oliver Jones on 27/10/10.
//  Copyright 2010 Deeper Design. All rights reserved.
//

#import "NSDictionary+Helper.h"


@implementation NSDictionary (Helper)

/////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*) stringForKey:(id)aKey
{
    id o = [self objectForKey:aKey];

    NSAssert([o isKindOfClass: [NSString class]], @"Not a string!");
    
    return (NSString*) o;
}

@end
