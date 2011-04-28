//
//  NSEnumeration+DDUtility.m
//  DDUtility
//
//  Created by Oliver Jones on 24/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import "NSEnumerator+DDUtility.h"
#import "DDPredicateEnumerator.h"
#import "DDSelectorEnumerator.h"
#import "DDConcatinateEnumerator.h"
#import "DDDistinctEnumerator.h"
#import "DDExceptEnumerator.h"

@implementation NSEnumerator (DDUtility)

/////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL) all: (BOOL (^)(id i)) predicate;
{
    id o = nil;
    while((o = [self nextObject]))
    {
        if (predicate(o) == NO)
        {
            return NO;
        }
    }
    
    return YES;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL) any
{
    return [self nextObject] != nil;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL) any: (BOOL (^)(id i)) predicate
{
    id o = nil;
    while((o = [self nextObject]))
    {
        if (predicate(o) == YES)
        {
            return YES;
        }
    }
    
    return NO;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (NSEnumerator*) where: (BOOL (^)(id i)) predicate
{
    return [DDPredicateEnumerator enumeratorWithEnumerator: self 
                                                 predicate: predicate];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (NSEnumerator*) select: (id (^)(id i)) selector
{
    return [DDSelectorEnumerator enumeratorWithEnumerator: self 
                                                 selector: selector];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (NSEnumerator*) concat: (NSEnumerator*) enumerator
{
    return [DDConcatinateEnumerator enumeratorWithEnumerators:[NSArray arrayWithObjects: self, enumerator, nil]];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger) count
{
    NSInteger count = 0;
    for (id o in self)
    {
        ++count;
    }
    
    return count;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger) count: (BOOL (^)(id i)) predicate
{
    NSInteger count = 0;
    for (id o in self) {
        if (predicate(o))
        {
            ++count;
        }
    }
    
    return count;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (NSEnumerator*) distinct
{
    return [DDDistinctEnumerator enumeratorWithEnumerator: self];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (NSEnumerator*) except:(NSEnumerator *)enumerator
{
    return [DDExceptEnumerator enumeratorWithEnumerator:self 
                                                exclude:enumerator];
}


@end
