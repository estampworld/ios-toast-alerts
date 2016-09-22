//
//  ToastView.m
//  ToastAlerts
//
//  Created by Eduardo Irías on 8/7/15.
//  Copyright (c) 2015 Estamp World. All rights reserved.
//

#import "EWToastAlertView.h"
#import "UIViewController+ext.h"

@interface EWToastAlertView ()

@property UIView *viewToast;
@property UILabel *messageLabel;
@property UIImageView *alertImageView;

@end

@implementation EWToastAlertView
//
//@synthesize frameSize;
//@synthesize shouldDismissWithTap;
//@synthesize shouldDismissWithTime;
//@synthesize dismissTime;
//////@synthesize message;
////@synthesize image;
//@synthesize images;
//@synthesize shouldRepeatImagesAnimation;
//@synthesize timeForImagesInAnimation;

#pragma mark - Init

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setVars];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setVars];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [self initWithCoder:coder];
    if (self) {
        
    }
    return self;
}

- (instancetype) initWithMessage:(NSString *) message image:(UIImage *) image {
    self = [self init];
    if (self) {
        [self setVars];
        
        _message = message;
        _image = image;
     
        self.shouldDismissWithTap = true;
        self.shouldDismissWithTime = true;
        
    }
    
    return self;
}

- (instancetype) initWithMessage:(NSString *) message image:(UIImage *) image  hideWithTap:(BOOL) tapHide hideWithTime:(BOOL) timeHide hideTime:(double) time {
    self = [self init];
    if (self) {
        [self setVars];
        
        _message = message;
        _image = image;
        
        self.shouldDismissWithTap = tapHide;
        self.shouldDismissWithTime = timeHide;
        
        self.dismissTime = time;
        
    }
    
    return self;
}

- (nonnull instancetype) initWithMessage:(nonnull NSString *) message images:(nonnull NSArray<UIImage *> *) images {
    self = [self init];
    if (self) {
        [self setVars];
        
        _message = message;
        _image = images[0];
        _images = images;
        
        self.shouldDismissWithTap = true;
        self.shouldDismissWithTime = true;
        
    }
    
    return self;
}

- (instancetype) initWithMessage:(NSString *) message images:(NSArray *) images  hideWithTap:(BOOL) tapHide hideWithTime:(BOOL) timeHide hideTime:(double) time {
    self = [self init];
    if (self) {
        [self setVars];
        
        _message = message;
        _image = images[0];
        _images = images;
        
        self.shouldDismissWithTap = tapHide;
        self.shouldDismissWithTime = timeHide;
        
        self.dismissTime = time;
        
    }
    
    return self;
}

- (void) setVars {
    self.dismissTime = 2.0;
    self.timeForImagesInAnimation = 0.2;
    self.images = [[NSArray alloc] init];
    self.shouldRepeatImagesAnimation = true;
    self.frameSize = 155;

    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver: self selector:   @selector(deviceOrientationDidChange:) name: UIDeviceOrientationDidChangeNotification object: nil];

}

- (void)deviceOrientationDidChange:(NSNotification *)notification {
    //Obtain current device orientation
    self.frame = CGRectMake(0, 0, [self screenSize].width, [self screenSize].height) ;
}

#pragma mark - View Cycle

- (void)willMoveToWindow {
    self.backgroundColor = [UIColor clearColor];
}

- (void) didMoveToWindow {
    self.frame = CGRectMake(0, 0, [self screenSize].width, [self screenSize].height) ;
    
    self.backgroundColor = [UIColor clearColor];
    
    [self createViewToast];
    [self createMessageLabel];
    [self createalertImageView];
    
    
    if (self.images.count > 0) {
        _alertImageView.image = self.images[self.images.count-1];
        [_alertImageView startAnimating];
    }
    if (self.shouldDismissWithTap) {
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissMessageView:)];
        tapGestureRecognizer.delegate = self;
        [self addGestureRecognizer:tapGestureRecognizer];
    }
    if (self.shouldDismissWithTime) {
        [NSTimer scheduledTimerWithTimeInterval:self.dismissTime target:self selector:@selector(dismissMessageView) userInfo:nil repeats:NO];
    }
}

-(void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
}

#pragma mark - SubViews

- (void) createViewToast {
    _viewToast = [[UIView alloc] init];
    _viewToast.backgroundColor = [UIColor colorWithRed:222.0/255.0 green:223.0/255.0 blue:227.0/255.0 alpha:1.0];
    _viewToast.layer.cornerRadius = 10;
    _viewToast.layer.masksToBounds = YES;
    [self addSubview:_viewToast];
    
    [_viewToast setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [_viewToast addConstraint:
     [NSLayoutConstraint
      constraintWithItem:_viewToast
      attribute:NSLayoutAttributeWidth
      relatedBy:NSLayoutRelationEqual
      toItem:nil
      attribute:NSLayoutAttributeWidth
      multiplier:1
      constant:self.frameSize]
     ];
    
    [_viewToast addConstraint:
     [NSLayoutConstraint
      constraintWithItem:_viewToast
      attribute:NSLayoutAttributeHeight
      relatedBy:NSLayoutRelationEqual
      toItem:nil
      attribute:NSLayoutAttributeHeight
      multiplier:1
      constant:self.frameSize]
     ];
    
    
    [self addConstraint:
     [NSLayoutConstraint constraintWithItem:_viewToast
                                  attribute:NSLayoutAttributeCenterX
                                  relatedBy:0
                                     toItem:self
                                  attribute:NSLayoutAttributeCenterX
                                 multiplier:1
                                   constant:0]];
    
    [self addConstraint:
     [NSLayoutConstraint constraintWithItem:_viewToast
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:0
                                     toItem:self
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1
                                   constant:0]];

}

- (void) createMessageLabel {
    _messageLabel = [[UILabel alloc] init];
    _messageLabel.text = self.message;
    _messageLabel.font = [UIFont systemFontOfSize:16.0];
    _messageLabel.textColor = [UIColor colorWithRed:90.0/255.0 green:94.0/255.0 blue:97.0/255.0 alpha:1.0];
    _messageLabel.textAlignment = NSTextAlignmentCenter;
    [_viewToast addSubview:_messageLabel];
    
    [_messageLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [_viewToast addConstraint:
     [NSLayoutConstraint
      constraintWithItem:_messageLabel
      attribute:NSLayoutAttributeTrailing
      relatedBy:NSLayoutRelationEqual
      toItem:_viewToast
      attribute:NSLayoutAttributeTrailing
      multiplier:1
      constant:0]
     ];
    
    [_viewToast addConstraint:
     [NSLayoutConstraint
      constraintWithItem:_messageLabel
      attribute:NSLayoutAttributeLeading
      relatedBy:NSLayoutRelationEqual
      toItem:_viewToast
      attribute:NSLayoutAttributeLeading
      multiplier:1
      constant:0]
     ];
    
    
    [_viewToast addConstraint:
     [NSLayoutConstraint
      constraintWithItem:_messageLabel
      attribute:NSLayoutAttributeBaseline
      relatedBy:NSLayoutRelationEqual
      toItem:_viewToast
      attribute:NSLayoutAttributeBaseline
      multiplier:1
      constant:-20]
     ];
    
    
    [_messageLabel addConstraint:
     [NSLayoutConstraint
      constraintWithItem:_messageLabel
      attribute:NSLayoutAttributeHeight
      relatedBy:NSLayoutRelationEqual
      toItem:nil
      attribute:NSLayoutAttributeHeight
      multiplier:1
      constant:32]
     ];
    
    
}

- (void) createalertImageView {
    _alertImageView = [[UIImageView alloc] init];
    _alertImageView.clipsToBounds = true;
    _alertImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [_viewToast addSubview:_alertImageView];
    
    if (self.images.count > 0) {
        _alertImageView.image = self.images[0];
        _alertImageView.animationImages = self.images;
        _alertImageView.animationDuration = self.timeForImagesInAnimation * self.images.count;
        if (!self.shouldRepeatImagesAnimation) {
            _alertImageView.animationRepeatCount = 1;
        }
    } else {
        _alertImageView.image = self.image;
    }
    [_alertImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [_viewToast addConstraint:
     [NSLayoutConstraint
      constraintWithItem:_alertImageView
      attribute:NSLayoutAttributeTrailing
      relatedBy:NSLayoutRelationEqual
      toItem:_viewToast
      attribute:NSLayoutAttributeTrailing
      multiplier:1
      constant:-10]
     ];
    
    [_viewToast addConstraint:
     [NSLayoutConstraint
      constraintWithItem:_alertImageView
      attribute:NSLayoutAttributeLeading
      relatedBy:NSLayoutRelationEqual
      toItem:_viewToast
      attribute:NSLayoutAttributeLeading
      multiplier:1
      constant:10]
     ];
    
    
    [_viewToast addConstraint:
     [NSLayoutConstraint
      constraintWithItem:_alertImageView
      attribute:NSLayoutAttributeTop
      relatedBy:NSLayoutRelationEqual
      toItem:_viewToast
      attribute:NSLayoutAttributeTop
      multiplier:1
      constant:20]
     ];
    
    [_viewToast addConstraint:
     [NSLayoutConstraint
      constraintWithItem:_alertImageView
      attribute:NSLayoutAttributeBaseline
      relatedBy:NSLayoutRelationEqual
      toItem:_messageLabel
      attribute:NSLayoutAttributeTop
      multiplier:1
      constant:-10]
     ];
    
    
    
}

#pragma mark - Dismiss

- (void) dismissMessageView  {
    [self dismiss];
}

- (void) dismissMessageView: (UIGestureRecognizer *) sender {
    [self dismissMessageView];
}


#pragma mark - Display

- (void) show {
    UIWindow *frontWindow = [UIApplication sharedApplication].keyWindow;
    [frontWindow addSubview:self];
}

- (void) dismiss {
    [self removeFromSuperview];
}

- (CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}


@end


