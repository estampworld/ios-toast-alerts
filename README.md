# iOS Toast Alert View Framework

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

A framework to display Toast Alerts in IOS.

[More Info](http://www.estamp.co/ios-toast-view/)


## Features

* Toast View with Message & Image
* Toast View with Message & Image Animation
* Toast View with Message & Image Animation Repeat
* Toast View with Time Dismiss
* Toast View with Tap Dismiss
* Custom Toast View

## Usage

### Swift
** Toast Alert View with Message & Image **

Show a Toast Alert with message and icon using a Extensions function
```
self.showEWToastAlert("Hey!", image: UIImage(named: "CatIcon")!)
```
Show a Toast Alert with message and icon using EWToastAlertView Object
```
let tav =  EWToastAlertView(message: "Hey!", image: UIImage(named: "Cat Icon")!)
tav.show()
```

** Toast Alert View with Time Dissmis Only **

```
//Toast Alert View with Time Dissmis Only
self.showToastAlert("5 Seconds",
                    image: UIImage(named: "img1")!,
                    hideWithTap: false,
                    hideWithTime: true,
                    hideTime: 5.0)
```

** Toast Alert View with Message & Image Animation **

```
//Toast Alert View with Message & Image Animation
let images = [UIImage(named: "item0")!,
              UIImage(named: "item1")!,
              UIImage(named: "item2")!]

self.showEWToastAlert("Single Animation",
                      images: images,
                      frameDuration: 0.1,
                      repeatAnimation: false,
                      hideWithTap: true,
                      hideWithTime: true,
                      hideTime: 5.0)
```

** Custom Toast Alert View Show **

```
//Custom EW Toast Alert View
let tav = EWToastAlertView()
tav.message = “Example”
tav.image = UIImage(named: “img1”)!
tav.show()
//tav.dismiss() to Hide
```

### Examples
![alt tag](http://static1.squarespace.com/static/543c2e48e4b07dd5493ff4a1/55d24661e4b09a7ab6e1c851/57d876d42e69cff710a6ea7c/1473803992838/Simulator+Screen+Shot+Sep+13%2C+2016%2C+3.59.38+PM.png)
