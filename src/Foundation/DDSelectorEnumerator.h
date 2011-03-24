//
//  DDSelectorEnumerator.h
//  DDUtility
//
//  Created by Oliver Jones on 24/03/11.
//  Copyright 2011 Deeper Design. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id (^DDSelectorBlock)(id i);

@interface DDSelectorEnumerator : NSEnumerator 
{
@private
    NSEnumerator* m_enumerator;
    DDSelectorBlock m_projection;
}

- (id) initWithEnumerator:(NSEnumerator*)e selector: (DDSelectorBlock)p;
+ (DDSelectorEnumerator*) enumeratorWithEnumerator:(NSEnumerator*)e selector: (DDSelectorBlock)p;

@end
