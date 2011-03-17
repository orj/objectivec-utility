//
//  NSString+DDUtility.m
//  DDUtility
//
//  Created by Oliver Jones on 17/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import "NSString+DDUtility.h"

#define DDLocalizedString(s) NSLocalizedString((s),(s))
#define L(s) DDLocalizedString((s))

@implementation NSString (DDUtility)

#pragma mark -
#pragma mark Class Methods

/////////////////////////////////////////////////////////////////////////////////////////////////
+ (NSString*) stringWithData:(NSData*)data encoding: (NSStringEncoding) encoding
{
    return [[[NSString alloc] initWithData: data encoding: encoding] autorelease];
}

#pragma mark -
#pragma mark Instance Methods

/////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL) isNotEqualToString: (NSString*) aString
{
    return [self isEqualToString: aString] == NO;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL) isEmpty
{
    return [self isEqualToString: @""];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL) isNotEmpty
{
    return [self isEmpty] == NO;
}

@end
