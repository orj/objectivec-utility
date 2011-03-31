//
//  NSEnumerator+DDUtilityTests.m
//  DDUtility
//
//  Created by Oliver Jones on 24/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import "NSEnumerator+DDUtilityTests.h"
#import "NSEnumerator+DDUtility.h"

@implementation NSEnumerator_DDUtilityTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (void) testA
{
    NSArray* a = [NSArray arrayWithObjects: @"AA", @"AB", @"AC", @"BA", @"BB", @"BC", nil];
    
    id e = [a objectEnumerator];
    
    NSArray* matches = [[[e 
       where: ^ BOOL (id i) { return [i hasPrefix: @"A"]; }] 
       where: ^ BOOL (id i) { return [i hasSuffix: @"C"]; }] 
        allObjects];
          
    for (id o in matches) {
        NSLog(@"%@", o);
    }
    
    BOOL t = [[matches objectEnumerator] any];
    
    GHAssertTrue(t, @"Test");
    
}

/////////////////////////////////////////////////////////////////////////////////////////////////
- (void) testB
{
    NSArray* a = [NSArray arrayWithObjects: 
                  [NSNumber numberWithInt: 0], 
                  [NSNumber numberWithInt: 1], 
                  [NSNumber numberWithInt: 2], 
                  [NSNumber numberWithInt: 3], 
                  [NSNumber numberWithInt: 4],
                  nil];
       
    __block int x = 2;
    id valueGreaterThanX = ^ BOOL (id i) { return [i intValue] > x; };
    id asQuotedString = ^ id (id i) { return [NSString stringWithFormat:@"'%@'", i]; };
    
    NSArray* matches1 = [[[[a objectEnumerator] where: valueGreaterThanX] select: asQuotedString] allObjects];
    
    for (id o in matches1) {
        NSLog(@"%@", o);
    }
    
    x = 3;
    NSArray* matches2 = [[[[a objectEnumerator] where: valueGreaterThanX] select: asQuotedString] allObjects];
    
    for (id o in matches2) {
        NSLog(@"%@", o);
    }
    
    BOOL t = [[matches1 objectEnumerator] any];
    
    GHAssertTrue(t, @"Test");
    
}


@end
