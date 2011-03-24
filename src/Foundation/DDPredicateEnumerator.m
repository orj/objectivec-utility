//
//  DDPredicateEnumerator.m
//  DDUtility
//
//  Created by Oliver Jones on 24/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import "DDPredicateEnumerator.h"

@implementation DDPredicateEnumerator

/////////////////////////////////////////////////////////////////////////////////////////////////
- (id) initWithEnumerator:(NSEnumerator*)e predicate: (DDPredicateBlock)p
{
    if ((self = [super init]))
    {
        m_enumerator = [e retain];
        m_predicate = [p copy];
    }
    
    return self;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (void) dealloc
{
    [m_enumerator release];
    [m_predicate release];
    
    m_enumerator = nil;
    m_predicate = nil;
    
    [super dealloc];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
+ (DDPredicateEnumerator*) enumeratorWithEnumerator:(NSEnumerator*)e predicate: (DDPredicateBlock)p
{
    return [[[DDPredicateEnumerator alloc] initWithEnumerator: e predicate: p] autorelease];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (NSArray *)allObjects
{
    NSMutableArray* t = [[NSMutableArray alloc] init];
    for (id o in m_enumerator)
    {
        if (m_predicate(o))
        {
            [t addObject: o];
        }
    }
    
    NSArray* result = [NSArray arrayWithArray: t];
    [t release];
    
    return result;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (id)nextObject
{
    id o = nil;
    do {
        o = [m_enumerator nextObject];
    }
    while(o != nil && m_predicate(o) == NO);
       
    return o;
}

@end