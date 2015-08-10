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

@end
