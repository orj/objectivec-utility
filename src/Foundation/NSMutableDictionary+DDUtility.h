//
//  NSMutableDictionary+Helper.h
//  GSPA
//
//  Created by Oliver Jones on 28/10/10.
//  Copyright 2010 Deeper Design. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableDictionary (Helper)

/*!
 @abstract      Returns a copy of the dictionary as a read-only NSDictionary.  
                The caller is responsible for releasing the copy.
 @result        A read-only copy of the dictionary.
 */
- (NSDictionary*) readonlyCopy;

@end
