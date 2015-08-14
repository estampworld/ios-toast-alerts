//
//  ToastAlertView.h
//  ToastAlerts
//
//  Created by Eduardo Irías on 8/7/15.
//  Copyright (c) 2015 Estamp World. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToastAlertView : UIView < UIGestureRecognizerDelegate>

#pragma mark - Attributes

/**
 The width and height of the frame
 The default value is 155
 */
@property double frameSize;

/**
 The amount of time an image will show
 The default value is 0.2
 @see images
 @see shouldRepeatImagesAnimation
 */
@property double timeForImagesInAnimation;
/**
 Ask if images should repeat
 The default value is true
 @see images
 @see timeForImagesInAnimation
 */
@property BOOL shouldRepeatImagesAnimation;
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
/**
 The image that should be display
 */
@property (nonatomic) UIImage *image;
/**
 The images that should be display
 @see timeForImagesInAnimation
 @see shouldRepeatImagesAnimation
 */
@property (nonatomic) NSArray *images;

#pragma mark - Functions

/**
 Inits a Toast Alert View with a message and image
 @param message The message to display
 @param image The image to display
 @see show Function
 @see dismiss Function
 */
- (instancetype) initWithMessage:(NSString *) message image:(UIImage *) image;

/**
 Inits a Toast Alert View with a message and image
 @param message The message to display
 @param image The image to display
 @param tapHide Should the Toast Alert View dismiss with Tap
 @param timeHide Should the Toast Alert View dismiss with Time
 @param time if timeHide is true, this is the time it will take to hide
 @see show Function
 @see dismiss Function
 */
- (instancetype) initWithMessage:(NSString *) message image:(UIImage *) image  hideWithTap:(BOOL) tapHide hideWithTime:(BOOL) timeHide hideTime:(double) time;
/**
 Show a Toast Alert View with user configurations
 */
- (void) show;

/**
 Dismiss a Toast Alert View with user configurations
 */
- (void) dismiss;


@end
