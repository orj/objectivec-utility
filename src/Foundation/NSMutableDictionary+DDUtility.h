//
//  NSMutableDictionary+DDUtility.h
//  DDUtility
//
//  Created by Oliver Jones on 2/02/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableDictionary (DDUtility)

/*!
 @abstract      Returns a copy of the dictionary as a read-only NSDictionary.  
                The caller is responsible for releasing the copy.
 @result        A read-only copy of the dictionary.
 */
- (NSDictionary*) readonlyCopy;

/*!
 @abstract      Adds a given key-value pair to the dictionary.
 */
- (void) setObject: (id) anObject 
    forUIntegerKey: (NSUInteger) aKey;

/*!
 @abstract      Adds a given key-value pair to the dictionary.
 */
- (void) setObject: (id) anObject 
     forIntegerKey: (NSInteger) aKey;


@end
