//
//  DDPredicateEnumerator.h
//  DDUtility
//
//  Created by Oliver Jones on 24/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL (^DDPredicateBlock)(id i);

@interface DDPredicateEnumerator : NSEnumerator
{
@private
    NSEnumerator* m_enumerator;
    DDPredicateBlock m_predicate;
}

- (id) initWithEnumerator:(NSEnumerator*)e predicate: (DDPredicateBlock)p;
+ (DDPredicateEnumerator*) enumeratorWithEnumerator:(NSEnumerator*)e predicate: (DDPredicateBlock)p;

@end
