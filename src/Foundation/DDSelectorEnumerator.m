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
        m_projection = [p copy];
    }
    
    return self;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (void) dealloc
{
    [m_enumerator release];
    [m_projection release];
    
    m_enumerator = nil;
    m_projection = nil;
    
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
        [t addObject: m_projection(o)];
    }
    
    NSArray* result = [NSArray arrayWithArray: t];
    [t release];
    
    return result;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (id)nextObject
{
    id o = nil;
    while((o = [m_enumerator nextObject]))
    {
        return m_projection(o);
    }
    
    return nil;
}

@end
