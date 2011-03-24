//
//  NSEnumeration+DDUtility.h
//  DDUtility
//
//  Created by Oliver Jones on 24/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSEnumerator (DDUtility)


/*!
 @abstract  Determines whether all elements of a sequence satisfy a condition.
 @param     predicate   A block to test each element for a condition.
 @result    YES if every element of the source sequence passes the test in the specified predicate, or if the sequence is empty; otherwise, NO.
 */
- (BOOL) all: (BOOL (^)(id i)) predicate;

/*!
 @abstract  Determines whether a sequence contains any elements.
 @result    YES if the source sequence contains any elements; otherwise, NO.
 */
- (BOOL) any;

/*!
 @abstract  Determines whether a sequence contains any elements.
 @param     predicate   A block to test each element for a condition.
 @result    YES if any elements in the source sequence pass the test in the specified predicate; otherwise, NO.
 */
- (BOOL) any: (BOOL (^)(id i)) predicate;


/*!
 @abstract  Filters a sequence of values based on a predicate.
 @param     predicate   A block to test each element for a condition.
 @result    A NSEnumerator whose elements are elements from the input sequence that satisfy the condition.
 */
- (NSEnumerator*) where: (BOOL (^)(id i)) predicate;

/*!
 @abstract  Projects each element of a sequence into a new form.
 @param     selector    A transform function to apply to each element.
 @result    A NSEnumerator whose elements are the result of invoking the transform function on each element of source.
 */
- (NSEnumerator*) select: (id (^)(id i)) selector;

@end
