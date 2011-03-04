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
 @abstract      Returns the value associated with a given key; or default if no value is associated with the given key.
 */
- (id) objectForKey: (id) aKey default: (id) aDefault;

/*!
 @abstract      Get a string for the specified dictionary key.
 */
- (NSString*) stringForKey: (id) aKey;

/*!
 @abstract      Get a BOOL for the specified key.
 */
- (BOOL) booleanForKey: (NSString*) aKey;

/*!
 @abstract      Gets a BOOL for the specified key; or default if no value is associated with the given key.
 */
- (BOOL) booleanForKey: (NSString*) aKey default: (BOOL) aDefault;

/*!
 @abstract      Gets a float for the specified key.
 */
- (float) floatForKey: (NSString*) aKey;

/*!
 @abstract      Gets a float for the specified key; or default if no value is associated with the given key.
 */
- (float) floatForKey: (NSString*) aKey default: (float) aDefault;

/*!
 @abstract      Returns the value associated with a given NSUInteger key.
 */
- (id) objectForUIntegerKey: (NSUInteger) aKey;

/*!
 @abstract      Returns the value associated with a given NSInteger key.
 */
- (id) objectForIntegerKey: (NSInteger) aKey;



@end
