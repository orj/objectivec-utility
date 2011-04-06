//
//  DDConcatinateEnumerator.m
//  DDUtility
//
//  Created by Oliver Jones on 7/04/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import "DDConcatinateEnumerator.h"


@implementation DDConcatinateEnumerator

/////////////////////////////////////////////////////////////////////////////////////////////////
- (id) initWithEnumerators:(NSArray*)enumerators
{
    if ((self = [super init]))
    {
        m_arrayEnumerator = [[enumerators objectEnumerator] retain];
        m_currentEnumerator = nil;
    }
    
    return self;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
+ (DDConcatinateEnumerator*) enumeratorWithEnumerators:(NSArray*)enumerators
{
    return [[[DDConcatinateEnumerator alloc] initWithEnumerators:enumerators] autorelease];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (NSArray *)allObjects
{
    NSMutableArray* t = [[NSMutableArray alloc] init];
    for (id e in m_arrayEnumerator)
    {
        for (id o in e)
        {
            [t addObject:o];
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
    
    do
    {        
        if (m_currentEnumerator && (o = [m_currentEnumerator nextObject]))
        {
            return o;
        }
    
        m_currentEnumerator = [m_arrayEnumerator nextObject];
    } 
    while (m_currentEnumerator);
    
    return nil;
}


@end
