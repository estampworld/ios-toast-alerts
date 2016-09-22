//
//  UIViewController+ext.m
//  ToastAlerts
//
//  Created by Eduardo Irías on 8/8/15.
//  Copyright (c) 2015 Estamp World. All rights reserved.
//

#import "UIViewController+ext.h"
#import "EWToastAlertView.h"

@implementation UIViewController (ext)

- (void) showEWToastAlert: (NSString *) message image:(UIImage *) image  {
    
   [self showEWToastAlert:message image:image hideWithTap:true hideWithTime:true hideTime:2.0];
    
}

- (void) showEWToastAlert: (NSString *) message image:(UIImage *) image hideWithTap:(BOOL) tapHide hideWithTime:(BOOL) timeHide hideTime:(double) time {
    
    [self showEWToastAlert:message images:@[image] frameDuration:0.2 repeatAnimation:false hideWithTap:tapHide hideWithTime:timeHide hideTime:time];
    
}

- (void) showEWToastAlert: (NSString *) message images:(NSArray *) images {
    [self showEWToastAlert:message images:images frameDuration:0.2 repeatAnimation:true hideWithTap:true hideWithTime:true hideTime:2.0];
}

- (void) showEWToastAlert: (NSString *) message images:(NSArray *) images frameDuration:(double) frameTime  repeatAnimation: (BOOL) repeatAnimation hideWithTap:(BOOL) tapHide hideWithTime:(BOOL) timeHide hideTime:(double) time {
    
    EWToastAlertView *toastViewController = [[EWToastAlertView alloc] init];
    
    toastViewController.shouldDismissWithTap = tapHide;
    toastViewController.shouldDismissWithTime = timeHide;
    toastViewController.dismissTime = time;
    
    toastViewController.message = message;
    toastViewController.images = images;
    toastViewController.shouldRepeatImagesAnimation = repeatAnimation;
    toastViewController.timeForImagesInAnimation =  frameTime;
    
    [toastViewController show];
    
}

@end
