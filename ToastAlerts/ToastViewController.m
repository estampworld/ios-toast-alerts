//
//  ToastViewController.m
//  ToastAlerts
//
//  Created by Eduardo Irías on 8/7/15.
//  Copyright (c) 2015 Estamp World. All rights reserved.
//

#import "ToastViewController.h"

@interface ToastViewController ()

@property UIView *viewToast;
@property UILabel *messageLabel;
@property UIImageView *decorationFrame;

@end

@implementation ToastViewController

@synthesize shouldDismissWithTap;
@synthesize shouldDismissWithTime;
@synthesize dismissTime;
@synthesize message;

- (instancetype)init
{
    self = [super init];
    if (self) {
        dismissTime = 2.0;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor clearColor];
    
    [self createViewToast];
    [self createMessageLabel];
    
}

- (void) createViewToast {
    _viewToast = [[UIView alloc] init];
    _viewToast.backgroundColor = [UIColor colorWithRed:222.0/255.0 green:223.0/255.0 blue:227.0/255.0 alpha:1.0];
    _viewToast.layer.cornerRadius = 20;
    _viewToast.layer.masksToBounds = YES;
    [self.view addSubview:_viewToast];
    
    [_viewToast setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [_viewToast addConstraint:
     [NSLayoutConstraint
      constraintWithItem:_viewToast
      attribute:NSLayoutAttributeWidth
      relatedBy:NSLayoutRelationEqual
      toItem:nil
      attribute:NSLayoutAttributeWidth
      multiplier:1
      constant:200]
     ];
    
    [_viewToast addConstraint:
     [NSLayoutConstraint
      constraintWithItem:_viewToast
      attribute:NSLayoutAttributeHeight
      relatedBy:NSLayoutRelationEqual
      toItem:nil
      attribute:NSLayoutAttributeHeight
      multiplier:1
      constant:200]
     ];
    
    
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:_viewToast
                                  attribute:NSLayoutAttributeCenterX
                                  relatedBy:0
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterX
                                 multiplier:1
                                   constant:0]];
    
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:_viewToast
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:0
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1
                                   constant:0]];

}

- (void) createMessageLabel {
    _messageLabel = [[UILabel alloc] init];
    _messageLabel.text = message;
    _messageLabel.font = [UIFont systemFontOfSize:22.0];
    _messageLabel.textColor = [UIColor colorWithRed:90.0/255.0 green:94.0/255.0 blue:97.0/255.0 alpha:1.0];
    [_messageLabel setTextAlignment:NSTextAlignmentCenter];
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
    
    
    
}


- (void) viewDidAppear:(BOOL)animated {
    if (shouldDismissWithTap) {
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissMessageView:)];
        tapGestureRecognizer.delegate = self;
        [self.view addGestureRecognizer:tapGestureRecognizer];
    }
    if (shouldDismissWithTime) {
        [NSTimer scheduledTimerWithTimeInterval:dismissTime target:self selector:@selector(dismissMessageView) userInfo:nil repeats:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dismissMessageView  {
    [self dismissViewControllerAnimated:true completion:^{
        
    }];
}

- (void) dismissMessageView: (UIGestureRecognizer *) sender {
    [self dismissMessageView];
}

- (void) sayHi {
    NSLog(@"yeah yeah");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
