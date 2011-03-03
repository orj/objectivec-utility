//
//  DDDebug.h
//  DDUtility
//
//  Created by Oliver Jones on 2/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DDAssertNotNil(x) \
    NSAssert1((x) != nil, @"%@ can not be nil", @#x)

#define DDAssertNotNilOrEmptyString(x) \
    NSAssert1((((x) != nil) && (![(x) isEqualToString: @""])), @"%@ can not be nil or empty", @#x) 
