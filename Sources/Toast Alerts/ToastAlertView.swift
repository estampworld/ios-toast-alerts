//
//  ToastAlertView.swift
//  Toast Alerts
//
//  Created by Eduardo Irias on 1/31/20.
//  Copyright © 2020 Eduardo Irias. All rights reserved.
//

import UIKit

public class ToastAlertView: UIView {
    
    // MARK: - Attributes

    /**
     The width and height of the frame
     The default value is 155
     */
    var frameSize = 0.0
    /**
     The amount of time an image will show
     The default value is 0.2
     @see images
     @see shouldRepeatImagesAnimation
     */
    var timeForImagesInAnimation = 0.0
    /**
     Ask if images should repeat
     The default value is true
     @see images
     @see timeForImagesInAnimation
     */
    var shouldRepeatImagesAnimation = false
    /**
     Ask if view should dismiss with tap
     The default value is false
     */
    var shouldDismissWithTap = false
    /**
     Ask if view should dismiss with time
     The default value is false
     @see dismissTime
     */
    var shouldDismissWithTime = false
    /**
     If shouldDismissWithTime is marked true, the view will dismiss with this time
     The default value is 2.0
     @see shouldDismissWithTime
     */
    var dismissTime = 0.0
    
    /**
     The message that should be display
     */
    var message = ""
    
    /**
     The image that should be display
     */
    var image: UIImage?
    /**
     The images that should be display
     @see timeForImagesInAnimation
     @see shouldRepeatImagesAnimation
     */
    var images: [UIImage]?

    private var messageLabel: UILabel!
    private var alertImageView: UIImageView?
    
    private let size = CGSize(width: 250, height: 266)
    static let toastTextColor = UIColor(red: 116.0 / 255.0, green: 117.0 / 255.0, blue: 119.0 / 255.0, alpha: 1.0)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setVars()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public init(message: String, image: UIImage) {
        super.init(frame: CGRect.zero)
        
        self.message = message
        self.image = image
        
        self.shouldDismissWithTap = true
        self.shouldDismissWithTime = true
        
        setVars()
    }
    
    /*
    init(message:String!, image:UIImage!, hideWithTap tapHide:Bool, hideWithTime timeHide:Bool, hideTime time:Double) {
        self = self.init()
        if (self != nil) {
            self.setVars()

            _message = message
            _image = image

            self.shouldDismissWithTap = tapHide
            self.shouldDismissWithTime = timeHide

            self.dismissTime = time

        }

        return self
    }

    init(message:String, images:[AnyObject]) {
        self = self.init()
        if (self != nil) {
            self.setVars()

            _message = message
            _image = images[0]
            _images = images

            self.shouldDismissWithTap = true
            self.shouldDismissWithTime = true

        }

        return self
    }

    init(message:String!, images:[AnyObject]!, hideWithTap tapHide:Bool, hideWithTime timeHide:Bool, hideTime time:Double) {
        self = self.init()
        if (self != nil) {
            self.setVars()

            _message = message
            _image = images[0]
            _images = images

            self.shouldDismissWithTap = tapHide
            self.shouldDismissWithTime = timeHide

            self.dismissTime = time

        }

        return self
    }
     */
    func setVars() {
        reCenter()

        
        dismissTime = 2.0
//        timeForImagesInAnimation = 0.2
//        images = []
//        shouldRepeatImagesAnimation = true
//        frameSize = 155
//
//
        self.backgroundColor = UIColor.clear //UIColor(red: 222.0 / 255.0, green: 223.0 / 255.0, blue: 227.0 / 255.0, alpha: 0.4)
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.prominent)
        
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.9
        self.addSubview(blurEffectView)
        
        NotificationCenter.default.addObserver(self, selector: #selector(reCenter), name: UIDevice.orientationDidChangeNotification, object: nil)

        messageLabel = UILabel()
        messageLabel.numberOfLines = 0
        messageLabel?.text = message
        messageLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        messageLabel?.textColor = ToastAlertView.toastTextColor
        messageLabel?.textAlignment = .center
        self.addSubview(messageLabel!)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        let padding: CGFloat = 52
        
        self.addConstraint(NSLayoutConstraint(item: messageLabel!, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: messageLabel!, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: messageLabel!, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))

        alertImageView = UIImageView()
        alertImageView?.clipsToBounds = true
        alertImageView?.contentMode = .scaleAspectFit
        alertImageView?.image = image
        alertImageView?.tintColor = ToastAlertView.toastTextColor
        self.addSubview(alertImageView!)
        alertImageView?.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraint(NSLayoutConstraint(item: alertImageView!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 132 ))
        
        self.addConstraint(NSLayoutConstraint(item: alertImageView!, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailingMargin, multiplier: 1, constant: -padding))
        self.addConstraint(NSLayoutConstraint(item: alertImageView!, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leadingMargin, multiplier: 1, constant: padding))
        
        self.addConstraint(NSLayoutConstraint(item: alertImageView!, attribute: .top, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1, constant: padding))
        
        self.addConstraint(NSLayoutConstraint(item: alertImageView!, attribute: .bottom, relatedBy: .equal, toItem: messageLabel, attribute: .top, multiplier: 1, constant: 0))

    }
    
    // MARK: - Display
    
    @objc private func reCenter() {
        let screenSize = UIScreen.main.bounds.size
        let x = (screenSize.width / 2.0) - size.width / 2
        let y = (screenSize.height / 2.0)  - size.height / 2
        frame = CGRect(x: x, y: y, width: size.width, height: size.height)
    }
    
    public func show() {
        let mainWindow = UIApplication.shared.windows.first
        mainWindow?.addSubview(self)
        
        Timer.scheduledTimer(withTimeInterval: dismissTime, repeats: false) { (timer) in
            self.removeFromSuperview()
            //NotificationCenter.default.addObserver(self, selector: #selector(reCenter), name: UIDevice.orientationDidChangeNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
        }
    }
}
