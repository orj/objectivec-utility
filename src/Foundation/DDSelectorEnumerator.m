//
//  DDSelectorEnumerator.m
//  DDUtility
//
//  Created by Oliver Jones on 24/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import "DDSelectorEnumerator.h"


@implementation DDSelectorEnumerator

/////////////////////////////////////////////////////////////////////////////////////////////////
- (id) initWithEnumerator:(NSEnumerator*)e selector: (DDSelectorBlock)p
{
    if ((self = [super init]))
    {
        m_enumerator = [e retain];
        m_selector = [p copy];
    }
    
    return self;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (void) dealloc
{
    [m_enumerator release];
    [m_selector release];
    
    m_enumerator = nil;
    m_selector = nil;
    
    [super dealloc];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
+ (DDSelectorEnumerator*) enumeratorWithEnumerator:(NSEnumerator*)e selector: (DDSelectorBlock)p
{
    return [[[DDSelectorEnumerator alloc] initWithEnumerator: e selector: p] autorelease];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (NSArray *)allObjects
{
    NSMutableArray* t = [[NSMutableArray alloc] init];
    for (id o in m_enumerator)
    {
        [t addObject: m_selector(o)];
    }
    
    NSArray* result = [NSArray arrayWithArray: t];
    [t release];
    
    return result;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (id)nextObject
{
    id o = nil;
    if ((o = [m_enumerator nextObject]))
    {
        return m_selector(o);
    }
    
    return nil;
}

@end
