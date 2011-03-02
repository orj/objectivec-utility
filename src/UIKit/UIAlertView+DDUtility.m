//
//  UIAlertView+Helper.m
//  GSPA
//
//  Created by Oliver Jones on 22/10/10.
//  Copyright 2010 Deeper Design. All rights reserved.
//

#import "UIAlertView+DDUtility.h"

@implementation UIAlertView (DDUtility)

/////////////////////////////////////////////////////////////////////////////////////////////////
+ (void) showAlertWithTitle: (NSString*) title 
                    message: (NSString*) message
                buttonTitle: (NSString*) buttonTitle
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle: title 
                                                    message: message 
                                                   delegate: nil
                                          cancelButtonTitle: buttonTitle
                                          otherButtonTitles: nil];
    [alert show];
    [alert autorelease];
}


@end
