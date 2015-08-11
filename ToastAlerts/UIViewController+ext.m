//
//  UIViewController+ext.m
//  ToastAlerts
//
//  Created by Eduardo Irías on 8/8/15.
//  Copyright (c) 2015 Estamp World. All rights reserved.
//

#import "UIViewController+ext.h"
#import "ToastAlertView.h"

@implementation UIViewController (ext)

- (void) showToastAlert: (NSString *) message image:(UIImage *) image  {
    
   [self showToastAlert:message image:image hideWithTap:true hideWithTime:true hideTime:2.0];
    
}

- (void) showToastAlert: (NSString *) message image:(UIImage *) image hideWithTap:(BOOL) tapHide hideWithTime:(BOOL) timeHide hideTime:(double) time {
    
    [self showToastAlert:message images:@[image] frameDuration:0.2 repeatAnimation:false hideWithTap:tapHide hideWithTime:timeHide hideTime:time];
    
}

- (void) showToastAlert: (NSString *) message images:(NSArray *) images {
    [self showToastAlert:message images:images frameDuration:0.2 repeatAnimation:true hideWithTap:true hideWithTime:true hideTime:2.0];
}

- (void) showToastAlert: (NSString *) message images:(NSArray *) images frameDuration:(double) frameTime  repeatAnimation: (BOOL) repeatAnimation hideWithTap:(BOOL) tapHide hideWithTime:(BOOL) timeHide hideTime:(double) time {
    
    ToastAlertView *toastViewController = [[ToastAlertView alloc] init];
    
    toastViewController.shouldDismissWithTap = tapHide;
    toastViewController.shouldDismissWithTime = timeHide;
    toastViewController.dismissTime = time;
    
    toastViewController.message = message;
    toastViewController.images = images;
    toastViewController.shouldRepeatImagesAnimation = repeatAnimation;
    toastViewController.timeForImagesInAnimation =  frameTime;
    
    [self.view.window addSubview:toastViewController];
    
}

@end
