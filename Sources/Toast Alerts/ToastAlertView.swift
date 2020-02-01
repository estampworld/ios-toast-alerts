//
//  ToastAlertView.swift
//  Toast Alerts
//
//  Created by Eduardo Irias on 1/31/20.
//  Copyright © 2020 Eduardo Irias. All rights reserved.
//

import UIKit

public class ToastAlertView: UIView {
    
    private let size = CGSize(width: 250, height: 266)
    static let toastTextColor = UIColor(red: 116.0 / 255.0, green: 117.0 / 255.0, blue: 119.0 / 255.0, alpha: 1.0)
    
    // MARK: - Attributes
    
    /**
     Status of the view if it should dismiss with a tap
     
     - Default: true
     */
    open var shouldDismissWithTap: Bool {
        switch dismissType {
        case .tap, .tapAndTime(_):
            return true
        default:
            return false
        }
    }
    
    /**
     Status of the view if it should dismiss with time
     The default value is false
     @see dismissTime
     */
    open var shouldDismissWithTime: Bool {
        switch dismissType {
        case .time(_), .tapAndTime(_):
            return true
        default:
            return false
        }
    }
    
    /**
     The view will dismiss with this time
     The default value is 2.0
     @see shouldDismissWithTime
     */
    open var dismissTime: TimeInterval {
        switch dismissType {
        case .time(let time):
            return time
        case .tapAndTime(let time):
            return time
        default:
            return 0.0
        }
    }
    
    var dismissType = DissmisType.tapAndTime(time: 2.0)

    /**
     The message that should be display
     */
    public var message: String? {
        didSet {
            if let messageLabel = messageLabel {
                messageLabel.text = message
            } else {
                addMessageLabel()
            }
        }
    }
    
    /**
     The image that should be display
     */
    public var image: UIImage? {
        didSet {
            if let alertImageView = alertImageView {
                alertImageView.image = image
            } else {
                addImageView()
            }
        }
    }
    
    private var messageLabel: UILabel?
    private var alertImageView: UIImageView?
    
    // MARK: - Init
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        layoutDisplay()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// A new ToastAlertView with message and image
    /// - Parameters:
    ///   - message: The message that will be displayed
    ///   - image: The image that will be displayed
    ///   - hideType: Type of dismissal actions
    public init(message: String, image: UIImage, hideWithType hideType: DissmisType = .tapAndTime()) {
        super.init(frame: CGRect.zero)
        
        layoutDisplay()
        addMessageLabel()
        addImageView()
        
        self.message = message
        self.image = image
        
        messageLabel?.text = message
        alertImageView?.image = image
        
        dismissType = hideType
    }
    
    // MARK: - UI
    
    private func addMessageLabel() {

        messageLabel = UILabel()
        
        guard let messageLabel = messageLabel else { return }
        
        messageLabel.numberOfLines = 0
        messageLabel.text = message
        messageLabel.font = UIFont.boldSystemFont(ofSize: 20)
        messageLabel.textColor = ToastAlertView.toastTextColor
        messageLabel.textAlignment = .center
        
        self.addSubview(messageLabel)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0))

        self.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -32))

    }
    
    private func addImageView() {
        alertImageView = UIImageView()
        
        guard let alertImageView = alertImageView else { return }
        
        let padding: CGFloat = 80
        
        alertImageView.clipsToBounds = true
        alertImageView.contentMode = .scaleAspectFit
        alertImageView.image = image
        alertImageView.tintColor = ToastAlertView.toastTextColor
        self.addSubview(alertImageView)
        
        alertImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraint(NSLayoutConstraint(item: alertImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 68))
        
        self.addConstraint(NSLayoutConstraint(item: alertImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 100))

        self.addConstraint(NSLayoutConstraint(item: alertImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
        self.addConstraint(NSLayoutConstraint(item: alertImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1, constant: padding))
        
        //self.addConstraint(NSLayoutConstraint(item: alertImageView, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: messageLabel, attribute: .top, multiplier: 1, constant: 0))
    }
    
    private func layoutDisplay() {
        self.isHidden = true
        reCenter()
        
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        NotificationCenter.default.addObserver(self, selector: #selector(reCenter), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.prominent)
        
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.9
        self.addSubview(blurEffectView)
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
        self.isHidden = false
        
        if shouldDismissWithTime {
            Timer.scheduledTimer(withTimeInterval: dismissTime, repeats: false) { (timer) in
                self.hide()
            }
        }
    }
    
    public func hide() {
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
        self.isHidden = true
        self.removeFromSuperview()
    }
}

extension ToastAlertView {
    public enum DissmisType {
        case none
        case tap
        case time(time: TimeInterval = 2.0)
        case tapAndTime(time: TimeInterval = 2.0)
    }
}
