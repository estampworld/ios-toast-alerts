# iOS Toast Alert View Framework
A framework to display Toast Alerts in IOS.

[More Info](http://estampworld.com/iostoastalerts/)


##Features
* Toast View with Message & Image
* Toast View with Message & Image Animation
* Toast View with Message & Image Animation Repeat
* Toast View with Time Dismiss
* Toast View with Tap Dismiss
* Custom Toast View

##Usage

###Swift
**Toast Alert View with Message & Image**

Show a Toast Alert with message and icon using a Extensions function
```
self.showToastAlert("Hey!", image: UIImage(named: "CatIcon")!)
```
Show a Toast Alert with message and icon using ToastAlertView Object
```
let tav =  ToastAlertView(message: "Hey!", image: UIImage(named: "Cat Icon")!)
tav.show()
```

**Toast Alert View with Time Dissmis Only**

```
//Toast Alert View with Time Dissmis Only
self.showToastAlert("5 Seconds",
                    image: UIImage(named: "img1")!,
                    hideWithTap: false,
                    hideWithTime: true,
                    hideTime: 5.0)
```

**Toast Alert View with Message & Image Animation**

```
//Toast Alert View with Message & Image Animation
let images = [UIImage(named: "item0")!,
              UIImage(named: "item1")!,
              UIImage(named: "item2")!]

self.showToastAlert("Single Animation",
                      images: images,
                      frameDuration: 0.1,
                      repeatAnimation: false,
                      hideWithTap: true,
                      hideWithTime: true,
                      hideTime: 5.0)
```

**Custom Toast Alert View Show**

```
//Custom Toast Alert View
let tav = ToastAlertView()
tav.message = “Example”
tav.image = UIImage(named: “img1”)!
tav.show()
//tav.dismiss() to Hide
```

###Examples
![alt tag](http://estampworld.com/iostoastalerts/images/ex1.png)
