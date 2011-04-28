//
//  DDExceptEnumerator.m
//  DDUtility
//
//  Created by Oliver Jones on 7/04/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import "DDExceptEnumerator.h"


@implementation DDExceptEnumerator

/////////////////////////////////////////////////////////////////////////////////////////////////
- (id) initWithEnumerator:(NSEnumerator*)enumerator 
                  exclude:(NSEnumerator*)exclude
{
    m_except = [[[NSMutableSet alloc] initWithArray:[exclude allObjects]] autorelease];
    DDPredicateBlock p = ^ BOOL (id o) 
    {
        if ([m_except containsObject:o])        
        {
            return false;
        }
        
        return true;
    };
    
    if ((self = [super initWithEnumerator:enumerator predicate:p]))
    {
        [m_except retain];
    }
    
    return self;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (void) dealloc
{
    [m_except release];
    m_except = nil;
    
    [super dealloc];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
+ (DDExceptEnumerator*) enumeratorWithEnumerator:(NSEnumerator*)enumerator 
                                         exclude:(NSEnumerator*)exclude
{
    return [[[DDExceptEnumerator alloc] initWithEnumerator: enumerator
                                                   exclude: exclude] autorelease];
}
@end
