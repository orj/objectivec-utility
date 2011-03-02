//
//  UIAlertView+Helper.h
//  GSPA
//
//  Created by Oliver Jones on 22/10/10.
//  Copyright 2010 Deeper Design. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIAlertView (DDUtility)

/*!
 @abstract  Shown an alert with the specified message.
 @param     title       The string that appears in the receiver’s title bar.
 @param     message     Descriptive text that provides more details than the title.
 @param     buttonTitle The title of the dismiss button.
 */

+ (void) showAlertWithTitle: (NSString*) title 
                    message: (NSString*) message
                buttonTitle: (NSString*) buttonTitle;
@end
