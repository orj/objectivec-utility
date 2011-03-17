//
//  NSData+DDUtility.h
//  DDUtility
//
//  Created by Oliver Jones on 17/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSData (DDUtility)

/*!
 @abstract          Returns an NSString object initialized by converting the NSData instance into Unicode characters using a given encoding.
 @param encoding    The encoding used by data.
 @result            An NSString object initialized by converting the bytes in data into Unicode characters using encoding.
 */
- (NSString*) asStringWithEncoding: (NSStringEncoding) encoding;

@end
