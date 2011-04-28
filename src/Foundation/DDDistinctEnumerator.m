//
//  DDDistinctEnumerator.m
//  DDUtility
//
//  Created by Oliver Jones on 7/04/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import "DDDistinctEnumerator.h"


@implementation DDDistinctEnumerator

/////////////////////////////////////////////////////////////////////////////////////////////////
- (id) initWithEnumerator:(NSEnumerator*)e
{
    m_seen = [[[NSMutableSet alloc] init] autorelease];
    DDPredicateBlock p = ^ BOOL (id o) 
    {
        if ([m_seen containsObject:o])        
        {
            return false;
        }
        
        [m_seen addObject: o];        
        return true;
    };

    if ((self = [super initWithEnumerator:e predicate:p]))
    {        
        [m_seen retain];
    }
    
    return self;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (void) dealloc
{
    [m_seen release];
    m_seen = nil;
    
    [super dealloc];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
+ (DDDistinctEnumerator*) enumeratorWithEnumerator:(NSEnumerator*)e
{
    return [[[DDDistinctEnumerator alloc] initWithEnumerator: e] autorelease];
}

@end
