//
//  NSData+DDUtility.m
//  DDUtility
//
//  Created by Oliver Jones on 17/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import "NSData+DDUtility.h"
#import "NSString+DDUtility.h"

@implementation NSData (DDUtility)

/////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*) asStringWithEncoding: (NSStringEncoding) encoding
{
    return [NSString stringWithData: self encoding: encoding];
}

@end
