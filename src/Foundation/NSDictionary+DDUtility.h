//
//  NSDictionary+Helper.h
//  GSPA
//
//  Created by Oliver Jones on 27/10/10.
//  Copyright 2010 Deeper Design. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (DDHelper)

/*!
 @abstract      Get a string for the specified dictionary key.
 */
- (NSString*) stringForKey:(id)key;

@end
