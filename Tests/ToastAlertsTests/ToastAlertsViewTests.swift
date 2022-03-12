//
//  ToastAlertsView.swift
//  ToastAlertsViewsTests
//
//  Created by Eduardo Irias on 1/31/20.
//  Copyright © 2020 Eduardo Irias. All rights reserved.
//

import XCTest
@testable import ToastAlerts

class ToastAlertsViewTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmptyView() {
        let toastAlertView = ToastAlertView()
        XCTAssertNil(toastAlertView.message)
        XCTAssertNil(toastAlertView.image)
    }
    
    func testMessage() {
        // Should update the message label
        
        let toastAlertView = ToastAlertView(message: "Test Message", image: UIImage())
        XCTAssertEqual(toastAlertView.message, "Test Message")
        
        let messageLabel = (toastAlertView.subviews.first { (view) -> Bool in
            return view is UILabel
        }) as? UILabel
        
        XCTAssertEqual(messageLabel?.text, "Test Message")
        
        toastAlertView.message = "Message 2"
        XCTAssertEqual(toastAlertView.message, "Message 2")
        XCTAssertEqual(messageLabel?.text, "Message 2")
    }
    
    func testImage() {
        // Should update the message label
        
        let toastAlertView = ToastAlertView(message: "Test Message", image: UIImage())
        XCTAssertNotNil(toastAlertView.image)
        
        let toastAlertView2 = ToastAlertView()
        XCTAssertNil(toastAlertView2.image)
        
        toastAlertView2.image = UIImage()
        XCTAssertNotNil(toastAlertView2.image)
    }

    func testImageTint() {
        let toastAlertView = ToastAlertView(message: "Test Message", image: UIImage())
        XCTAssertEqual(toastAlertView.alertImageView?.tintColor, UIColor.toastAlertTint)
        toastAlertView.shouldAddTintColor = false
        XCTAssertNotEqual(toastAlertView.alertImageView?.tintColor, UIColor.toastAlertTint)
    }
    
    func testDismissWithTapAndTime() {
        let toastAlertView = ToastAlertView(message: "Test Message", image: UIImage())
        toastAlertView.show()
        XCTAssertEqual(toastAlertView.isDismissedWithTap, true)
        XCTAssertEqual(toastAlertView.dismissTime, 1)
        XCTAssertEqual(toastAlertView.isdDismissedWithTime, true)
    }
    
    func testNotDismissWithTapAndTime() {
        let toastAlertView = ToastAlertView(message: "Test Message", image: UIImage(), hideWithType: .none)
        toastAlertView.show()
        XCTAssertEqual(toastAlertView.isDismissedWithTap, false)
        XCTAssertNil(toastAlertView.dismissTime)
        XCTAssertEqual(toastAlertView.isdDismissedWithTime, false)
    }
    
    
    func testDismissWithTapAndNoTime() {
        let toastAlertView = ToastAlertView(message: "Test Message", image: UIImage(), hideWithType: .tap)
        toastAlertView.show()
        XCTAssertEqual(toastAlertView.isDismissedWithTap, true)
        XCTAssertNil(toastAlertView.dismissTime)
        XCTAssertEqual(toastAlertView.isdDismissedWithTime, false)
    }
    
    
    func testNotDismissNoTapAndWithTime() {
        let toastAlertView = ToastAlertView(message: "Test Message", image: UIImage(), hideWithType: .time(time: 10.0))
        toastAlertView.show()
        XCTAssertEqual(toastAlertView.isDismissedWithTap, false)
        XCTAssertEqual(toastAlertView.dismissTime, 10)
        XCTAssertEqual(toastAlertView.isdDismissedWithTime, true)
    }
    
    func testShow() {
        let toastAlertView = ToastAlertView(message: "Test Message", image: UIImage())
        XCTAssertTrue(toastAlertView.isHidden)
        toastAlertView.show()
        XCTAssertFalse(toastAlertView.isHidden)
    }
    
    func testMultipleShows() {
        let toastAlertView = ToastAlertView(message: "Test Message", image: UIImage())
        XCTAssertNil(toastAlertView.superview)
        toastAlertView.show()
        XCTAssertFalse(toastAlertView.isHidden)
        toastAlertView.show()
        XCTAssertFalse(toastAlertView.isHidden)
    }

    func testHide() {
        let toastAlertView = ToastAlertView(message: "Test Message", image: UIImage())
        toastAlertView.dismissType = .none
        toastAlertView.show()
        XCTAssertFalse(toastAlertView.isHidden)
        toastAlertView.hide()
        XCTAssertTrue(toastAlertView.isHidden)
    }
}
