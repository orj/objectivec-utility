//
//  DDConcatinateEnumerator.h
//  DDUtility
//
//  Created by Oliver Jones on 7/04/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @abstract  An NSEnumerator subclass concatinates the members to several sequences into a single sequence.
 */
@interface DDConcatinateEnumerator : NSEnumerator 
{
@private
    NSEnumerator* m_arrayEnumerator;
    NSEnumerator* m_currentEnumerator;
}

- (id) initWithEnumerators:(NSArray*)enumerators;
+ (DDConcatinateEnumerator*) enumeratorWithEnumerators:(NSArray*)enumerators;

@end
