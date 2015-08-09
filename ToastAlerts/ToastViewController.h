//
//  ToastViewController.h
//  ToastAlerts
//
//  Created by Eduardo Irías on 8/7/15.
//  Copyright (c) 2015 Estamp World. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToastViewController : UIViewController < UIGestureRecognizerDelegate>

/**
 Ask if view should dismiss with tap
 The default value is false
 */
@property BOOL shouldDismissWithTap;
/**
 Ask if view should dismiss with time
 The default value is false
 @see dismissTime
 */
@property BOOL shouldDismissWithTime;
/**
 If shouldDismissWithTime is marked true, the view will dismiss with this time
 The default value is 2.0
 @see shouldDismissWithTime
 */
@property (nonatomic) double dismissTime;

/**
 The message that should be display
 */
@property (nonatomic) NSString *message;

- (void) sayHi;

@end
