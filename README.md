# iOS Toast Alert View Framework


[![Swift Package Manager compatible](https://img.shields.io/badge/SPM-compatible-success)](https://swift.org/package-manager/) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

[![Build Status](https://app.bitrise.io/app/6e1f2a3c6874f365/status.svg?token=nmCRIexD1jSq6XuVnwhN5w)](https://app.bitrise.io/app/6e1f2a3c6874f365)

[![codebeat badge](https://codebeat.co/badges/40505224-33e8-49e2-8fdc-6385bc3e46b5)](https://codebeat.co/projects/github-com-estampworld-ios-toast-alerts-master)

A framework to display Toast Alerts in IOS.

[More Info](http://www.estamp.co/ios-toast-view/)


## Features

* Toast View with Message & Image
* Toast View with Time Dismiss
* Toast View with Tap Dismiss
* Custom Toast View

## Install

### Swift Package Manager

#### Adding it to an existent iOS Project via Swift Package Manager

- Using Xcode 11 go to File > Swift Packages > Add Package Dependency
- Paste the project URL: https://github.com/estampworld/ios-toast-alerts
- Click on next and select the project target

### Carthage

Add the following line to your Cartfile:
```
github "estampworld/ios-toast-alerts"
```
Run `carthage update`


### Cocoapods

Add the pod to your Podfile:
```
pod 'toastalerts'
```
And then run:
```
pod install
```

## Usage

### Swift
#### Toast Alert View with Message & Image

Show a Toast Alert with message and icon using ToastAlertView Object
```
let toastAlertView =  ToastAlertView(message: "Hey!", image: UIImage(named: "Cat Icon")!)
toastAlertView.show()
```

#### Toast Alert View with Time Dissmis Only

```
//Toast Alert View with Time Dissmis Only
let toastAlertView = ToastAlertView(message: "4 Seconds", image: UIImage(systemName: "flame")!, hideWithType: .time(time: 4))
toastAlertView.show()
```

#### Custom Toast Alert View Show

```
//Custom EW Toast Alert View
let toastAlertView = ToastAlertView()
toastAlertView.message = "Example"
toastAlertView.image = UIImage(named: "img1")!
toastAlertView.show()
//toastAlertView.dismiss() to Hide
```

### Examples
<img src="Example/example1.png" width="320px" alt="Example" />
