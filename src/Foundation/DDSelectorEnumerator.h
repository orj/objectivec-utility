//
//  DDSelectorEnumerator.h
//  DDUtility
//
//  Created by Oliver Jones on 24/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id (^DDSelectorBlock)(id i);

/*!
 @abstract  An NSEnumerator subclass that iterates over a source sequence executing a selector block for each sequence member and returning the result of the selector as its own sequence item.
 */
@interface DDSelectorEnumerator : NSEnumerator 
{
@private
    NSEnumerator* m_enumerator;
    DDSelectorBlock m_selector;
}

- (id) initWithEnumerator:(NSEnumerator*)e selector: (DDSelectorBlock)p;
+ (DDSelectorEnumerator*) enumeratorWithEnumerator:(NSEnumerator*)e selector: (DDSelectorBlock)p;

@end
