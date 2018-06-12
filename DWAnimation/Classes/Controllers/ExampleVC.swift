//
//  ExampleVC.swift
//  DWAnimation
//
//  Created by Dion Wu on 2018/6/11.
//  Copyright © 2018年 DionWu. All rights reserved.
//

import UIKit

class ExampleVC: UIViewController {

    @IBOutlet var exampleView: ExampleView!
    
    let layer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
