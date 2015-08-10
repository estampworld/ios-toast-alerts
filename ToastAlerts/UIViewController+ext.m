//
//  UIViewController+ext.m
//  ToastAlerts
//
//  Created by Eduardo Irías on 8/8/15.
//  Copyright (c) 2015 Estamp World. All rights reserved.
//

#import "UIViewController+ext.h"
#import "ToastViewController.h"

@implementation UIViewController (ext)

- (void) showToastAlert: (NSString *) message image:(UIImage *) image  {
    
   [self showToastAlert:message image:image hideWithTap:true hideWithTime:true hideTime:2.0];
    
}

- (void) showToastAlert: (NSString *) message image:(UIImage *) image hideWithTap:(BOOL) tapHide hideWithTime:(BOOL) timeHide hideTime:(double) time {
    
    ToastViewController *toastViewController = [[ToastViewController alloc] init];
    toastViewController.shouldDismissWithTap = tapHide;
    toastViewController.shouldDismissWithTime = timeHide;
    toastViewController.dismissTime = time;
    
    toastViewController.message = message;
    toastViewController.image = image;
    
    toastViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;
    toastViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:toastViewController animated:true completion:^{
        
    }];
    
    
}

@end
