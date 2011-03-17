//
//  NSObject+DDUtility.h
//  DDUtility
//
//  Created by Oliver Jones on 17/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (DDUtility)

/*!
 @abstract      Returns a Boolean value that indicates whether the receiver and a given object are not equal.
 @param         anObject The object to be compared to the receiver.
 @result        YES if the receiver and anObject are not equal, otherwise NO.
 */
- (BOOL) isNotEqual: (id) anObject;

@end
