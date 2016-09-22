//
//  UIViewController+ext.h
//  ToastAlerts
//
//  Created by Eduardo Irías on 8/8/15.
//  Copyright (c) 2015 Estamp World. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ext)

/**
 Show a Toast Alert View with a message and single image
 @param message The message to display
 @param image The image to display
 */
- (void) showEWToastAlert: (nonnull NSString *) message image:(nonnull UIImage *) image;

/**
 Show a Toast Alert View with a message and single image
 @param message The message to display
 @param image The image to display
 @param tapHide Should the Toast Alert View dismiss with Tap
 @param timeHide Should the Toast Alert View dismiss with Time
 @param time if timeHide is true, this is the time it will take to hide
 */
- (void) showEWToastAlert: (nonnull NSString *) message image:(nonnull UIImage *) image hideWithTap:(BOOL) tapHide hideWithTime:(BOOL) timeHide hideTime:(double) time;

/**
 Show a Toast Alert View with a message and single image
 @param message The message to display
 @param images The images animation to display
 */
- (void) showEWToastAlert: (nonnull NSString *) message images:(nonnull NSArray <UIImage *> *) images;

/**
 Show a Toast Alert View with a message and single image
 @param message The message to display
 @param images The images animation to display
 @param frameDuration the image frame time to display
 @param tapHide Should the Toast Alert View dismiss with Tap
 @param timeHide Should the Toast Alert View dismiss with Time
 @param time if timeHide is true, this is the time it will take to hide
 */
- (void) showEWToastAlert: (nonnull NSString *) message images:(nonnull NSArray *) images frameDuration:(double) frameTime  repeatAnimation: (BOOL) repeatAnimation hideWithTap:(BOOL) tapHide hideWithTime:(BOOL) timeHide hideTime:(double) time;

@end
