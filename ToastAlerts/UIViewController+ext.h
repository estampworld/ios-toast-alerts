//
//  UIViewController+ext.h
//  ToastAlerts
//
//  Created by Eduardo Irías on 8/8/15.
//  Copyright (c) 2015 Estamp World. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ext)

- (void) showToastAlert: (NSString *) message image:(UIImage *) image;
- (void) showToastAlert: (NSString *) message image:(UIImage *) image hideWithTap:(BOOL) tapHide hideWithTime:(BOOL) timeHide hideTime:(double) time;
- (void) showToastAlert: (NSString *) message images:(NSArray *) images;
- (void) showToastAlert: (NSString *) message images:(NSArray *) images hideWithTap:(BOOL) tapHide hideWithTime:(BOOL) timeHide hideTime:(double) time;

@end