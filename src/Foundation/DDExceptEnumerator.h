//
//  DDExceptEnumerator.h
//  DDUtility
//
//  Created by Oliver Jones on 7/04/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDPredicateEnumerator.h"

@interface DDExceptEnumerator : DDPredicateEnumerator {
@private
    NSMutableSet* m_except;
}

- (id) initWithEnumerator:(NSEnumerator*)enumerator exclude:(NSEnumerator*)exclude;
+ (DDExceptEnumerator*) enumeratorWithEnumerator:(NSEnumerator*)enumerator exclude:(NSEnumerator*)exclude;

@end
