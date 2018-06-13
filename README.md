# DWAnimation

```DWAnimation``` is a easy to use animation written in Swift.

build from.
* Swift 4.1
* Xcode 9.3

## Installation
add following file to your project.

```Pulsing.swift```<br>
```CirclePulsing.swift```

## Usage

### Simple Animation
you can creat a pulsing animation like this.

``` swift
  let pulsing = Pulsing(position: self.view.center, toRadius: 50, color: UIColor.blue.cgColor)
```

you can change the animation duration use this property ```animationDuration``` default value is 1.<br>
``` swift
  pulsing.animationDuration = 2
```

creat a circlePulsing animation like this.
``` swift
  let circlePulsing = CirclePulsing(position: self.view.center, toRadius: 300, color: UIColor.blue.cgColor)
  circlePulsing.animationDuration = 2
```

change the animation where radius start use this property ```fromRadius``` default value is 0.1.<br>
``` swift
  circlePulsing.fromRadius = 50
```

add the animation to view.
``` swift
  self.view.layer.addSublayer(pulsing)
  self.view.layer.addSublayer(circlePulsing)
```

you will get a result like this.<br>
![](https://github.com/Dion-Wu/DWAnimation/blob/master/DWAnnimation-1.gif)  

### Constant Animation
also you can creat a constant animation.

first creat two property.
``` swift
  var pulsing: Pulsing!
  var circlePulsing: CirclePulsing!
```

you can change the animation repeat times use this property ```repeatTimes``` default value is 1.

creat a function like this.
``` swift
    func pulsingAnimation(repeatTimes: Float, duration: TimeInterval) {
        self.pulsing = Pulsing(position: self.view.center, toRadius: 50, color: UIColor.blue.cgColor)
        self.pulsing.animationDuration = duration
        self.pulsing.repeatTimes = repeatTimes
        self.view.layer.addSublayer(self.pulsing)
        
        self.circlePulsing = CirclePulsing(position: self.view.center, toRadius: 300, color: UIColor.blue.cgColor)
        self.circlePulsing.animationDuration = duration
        self.circlePulsing.repeatTimes = repeatTimes
        self.circlePulsing.fromRadius = 50
        self.view.layer.addSublayer(self.circlePulsing)
    }
```
run this function.
``` swift
  self.pulsingAnimation(repeatTimes: Float.infinity, duration: 1)
```

creat stop animation function like this.
``` swift
    func stopAnimation() {
        self.pulsing.removeAllAnimations()
        self.circlePulsing.removeAllAnimations()
    }
```
run this function to stop.
``` swift 
  self.stopAnimation()
```

you will get a result like this.<br>
![](https://github.com/Dion-Wu/DWAnimation/blob/master/DWAnnimation-2.gif)

### Example
following is my example

``` swift
//ExampleVC.swift
import UIKit

class ExampleVC: UIViewController {

    @IBOutlet var exampleView: ExampleView!
    
    let layer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidLayoutSubviews() {
        
        self.pulsingAnimation(repeatTimes: Float.infinity, duration: 3)
        
        let path = UIBezierPath(arcCenter: self.exampleView.imageView.center, radius: 40, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        
        self.layer.path = path.cgPath
        self.layer.fillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.view.layer.insertSublayer(layer, below: self.exampleView.imageView.layer)
    }

    func pulsingAnimation(repeatTimes: Float, duration: TimeInterval) {
        let pulsing = Pulsing(position: self.exampleView.imageView.center, toRadius: 40, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        pulsing.animationDuration = duration
        pulsing.repeatTimes = repeatTimes
        pulsing.opacityFromRadius = 0
        pulsing.opacityToRadius = 1
        self.view.layer.insertSublayer(pulsing, below: self.exampleView.imageView.layer)
        
        let circlePulsing = CirclePulsing(position: self.exampleView.imageView.center, toRadius: 300, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        circlePulsing.animationDuration = duration
        circlePulsing.repeatTimes = repeatTimes
        circlePulsing.fromRadius = 40
        self.view.layer.insertSublayer(circlePulsing, below: self.exampleView.imageView.layer)
        
        //opacity
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0
        opacityAnimation.duration = duration
        opacityAnimation.repeatCount = repeatTimes
        self.layer.add(opacityAnimation, forKey: "opacityPulsing")
    }
}
```

``` swift 
//ExampleView.swift
import UIKit

class ExampleView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colors:[CGColor] = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0).cgColor,#colorLiteral(red: 0.4235294118, green: 0.8117647059, blue: 0.8901960784, alpha: 0.3022285265).cgColor,#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0).cgColor]
        let locations:[CGFloat] = [0.57, 0.57, 1.0]
        guard let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations) else {
            return
        }
        context.drawRadialGradient(gradient, startCenter: self.imageView.center, startRadius: 0, endCenter: self.imageView.center, endRadius: 70, options: .drawsBeforeStartLocation)
    }
}
```
result like this.<br>
![](https://github.com/Dion-Wu/DWAnimation/blob/master/DWAnnimation-3.gif)
