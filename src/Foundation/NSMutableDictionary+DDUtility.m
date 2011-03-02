//
//  NSMutableDictionary+Helper.m
//  GSPA
//
//  Created by Oliver Jones on 28/10/10.
//  Copyright 2010 Deeper Design. All rights reserved.
//

#import "NSMutableDictionary+Helper.h"


@implementation NSMutableDictionary (Helper)

/////////////////////////////////////////////////////////////////////////////////////////////////
- (NSDictionary*) asDictionary
{
    return [NSDictionary dictionaryWithDictionary: self];
}

@end
