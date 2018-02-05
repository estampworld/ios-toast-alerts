//
//  EWToastAlertsTests.m
//  EWToastAlertsTests
//
//  Created by Eduardo Irias on 2/5/18.
//  Copyright © 2018 Estamp. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EWToastAlerts.h"

@interface EWToastAlertsTests : XCTestCase

@end

@implementation EWToastAlertsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEmptyTAView {
    // This is an example of a view with a message
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    EWToastAlertView *view = [EWToastAlertView new];
    view.message = @"Test";
    XCTAssertNotNil(view);
    XCTAssertNotNil(view.message);
    XCTAssertNil(view.image);
    XCTAssertEqual(2.0, view.dismissTime);
    XCTAssertFalse(view.shouldDismissWithTap);
    XCTAssertFalse(view.shouldDismissWithTime);
}

- (void)testImageTAView {
    // This is an example of a functional Toast Alert View with a message and image.
    EWToastAlertView *view = [[EWToastAlertView new] initWithMessage:@"Test" image:[UIImage new]];
    XCTAssertNotNil(view);
    XCTAssertNotNil(view.message);
    XCTAssertNotNil(view.image);
    XCTAssertTrue(view.shouldDismissWithTap);
    XCTAssertTrue(view.shouldDismissWithTime);
}


@end
