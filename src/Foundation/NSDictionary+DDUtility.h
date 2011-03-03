//
//  NSDictionary+Helper.h
//  GSPA
//
//  Created by Oliver Jones on 2/02/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (DDUtility)

/*!
 @abstract      Get a string for the specified dictionary key.
 */
- (NSString*) stringForKey: (id) key;

/*!
 @abstract      Returns the value associated with a given NSUInteger key.
 */
- (id) objectForUIntegerKey: (NSUInteger) aKey;

/*!
 @abstract      Returns the value associated with a given NSInteger key.
 */
- (id) objectForIntegerKey: (NSInteger) aKey;



@end
