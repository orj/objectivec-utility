//
//  NSString+DDUtility.h
//  DDUtility
//
//  Created by Oliver Jones on 17/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DDUtility)

/*!
 @abstract      Returns a Boolean value that indicates whether a given string is not equal to 
 the receiver using an literal Unicode-based comparison.
 @param         aString The string with which to compare the receiver.
 @result        NO if aString is equivalent to the receiver (if they have the same id or 
 if they are NSOrderedSame in a literal comparison), otherwise YES.
 */
- (BOOL) isNotEqualToString: (NSString*) aString;

/*!
 @abstract      Returns a Boolean value that indicates whether the string is empty or not.
 @result        YES if the string is empty; otherwise NO.
 */
- (BOOL) isEmpty;

/*!
 @abstract      Returns a Boolean value that indicates whether the string is empty or not.
 @result        NO if the string is empty; otherwise YES.
 */
- (BOOL) isNotEmpty;

/*!
 @abstract          Returns an NSString object initialized by converting given data into Unicode characters using a given encoding.
 @param data        An NSData object containing bytes in encoding and the default plain text format (that is, pure content with no attributes or other markups) for that encoding.
 @param encoding    The encoding used by data.
 
 @result            An NSString object initialized by converting the bytes in data into Unicode characters using encoding.
 
 */
+ (NSString*) stringWithData:(NSData*)data encoding: (NSStringEncoding) encoding;

@end
