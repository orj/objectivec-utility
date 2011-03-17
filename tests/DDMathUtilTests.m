//
//  MathUtilTest.m
//  MathUtilTest
//
//  Created by Oliver Jones on 14/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import "DDMathUtilTests.h"
#import "DDMathUtil.h"

@implementation DDMathUtilTests

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
- (void)testConstrainFloatValue
{
    GHAssertEquals( 0.0f, [DDMathUtil constrainFloatValue:  0.0f betweenMin: 0.0f max: 10.0f], @"");
    GHAssertEquals( 0.0f, [DDMathUtil constrainFloatValue: 10.0f betweenMin: 0.0f max: 10.0f], @"");
    GHAssertEquals( 5.0f, [DDMathUtil constrainFloatValue:  5.0f betweenMin: 0.0f max: 10.0f], @"");
    GHAssertEquals( 5.0f, [DDMathUtil constrainFloatValue: 15.0f betweenMin: 0.0f max: 10.0f], @"");
    GHAssertEquals( 9.0f, [DDMathUtil constrainFloatValue: -1.0f betweenMin: 0.0f max: 10.0f], @"");
    GHAssertEquals( 5.0f, [DDMathUtil constrainFloatValue:-15.0f betweenMin: 0.0f max: 10.0f], @"");
    
    GHAssertEquals( 0.0f, [DDMathUtil constrainFloatValue: 10.0f betweenMin: -5.0f max: 5.0f], @"");
    GHAssertEquals(-5.0f, [DDMathUtil constrainFloatValue: -5.0f betweenMin: -5.0f max: 5.0f], @"");
    GHAssertEquals(-5.0f, [DDMathUtil constrainFloatValue:  5.0f betweenMin: -5.0f max: 5.0f], @"");
}

@end
