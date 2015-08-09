//
//  ExtensionA.swift
//  ToastAlerts
//
//  Created by Eduardo Irías on 8/7/15.
//  Copyright (c) 2015 Estamp World. All rights reserved.
//

import UIKit

public class ExtensionA: NSObject {
    
    public func extend() {
       println("message")
    }
    
}

public extension UIViewController {
    public func showMessage() {
        println("message")
    }
}