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
        let toastAlertView = ToastAlertView(frame: .zero)
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
        
        let toastAlertView2 = ToastAlertView(frame: .zero)
        XCTAssertNil(toastAlertView2.image)
        
        toastAlertView2.image = UIImage()
        XCTAssertNotNil(toastAlertView2.image)
    }


}
