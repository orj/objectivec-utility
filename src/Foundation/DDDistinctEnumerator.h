//
//  DDDistinctEnumerator.h
//  DDUtility
//
//  Created by Oliver Jones on 7/04/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDPredicateEnumerator.h"

@interface DDDistinctEnumerator : DDPredicateEnumerator
{
@private
    NSMutableSet* m_seen;
}

- (id) initWithEnumerator:(NSEnumerator*)enumerator;
+ (DDDistinctEnumerator*) enumeratorWithEnumerator:(NSEnumerator*)enumerator;


@end
