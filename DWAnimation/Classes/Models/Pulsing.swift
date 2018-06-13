//
//  Pulsing.swift
//  DWAnimation
//
//  Created by Dion Wu on 2018/6/13.
//  Copyright © 2018年 DionWu. All rights reserved.
//

import UIKit

class Pulsing: CAShapeLayer {
    
    var animationGroup = CAAnimationGroup()
    var pathPosition = CGPoint(x: 0, y: 0)
    var repeatTimes: Float = 1
    var animationDuration: TimeInterval = 1
    var fromRadius: CGFloat = 0.1
    var toRadius: CGFloat = 100
    var opacityFromRadius: Float = 1
    var opacityToRadius: Float = 0
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(position: CGPoint, toRadius: CGFloat, color: CGColor) {
        super.init()
        
        let path = UIBezierPath(arcCenter: position, radius: 0, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        
        self.path = path.cgPath
        self.fillColor = color
        self.strokeColor = color
        self.lineWidth = 3
        self.pathPosition = position
        self.toRadius = toRadius
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            
            self.setupAnimationGroup()
            
            DispatchQueue.main.async {
                self.add(self.animationGroup, forKey: "Pulsing")
            }
        }
    }
    
    func createOpacityAnimation() -> CABasicAnimation {
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = self.opacityFromRadius
        opacityAnimation.toValue = self.opacityToRadius
        
        return opacityAnimation
    }
    
    func createPathAnimation() -> CABasicAnimation {
        
        let pathAnimation = CABasicAnimation(keyPath: "path")
        let fromPath = UIBezierPath(arcCenter: self.pathPosition, radius: self.fromRadius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        let toPath = UIBezierPath(arcCenter: self.pathPosition, radius: self.toRadius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        pathAnimation.fromValue = fromPath.cgPath
        pathAnimation.toValue = toPath.cgPath
        
        return pathAnimation
    }
    
    func setupAnimationGroup() {
        
        self.animationGroup.duration = self.animationDuration
        self.animationGroup.repeatCount = self.repeatTimes
        let defaultCurve = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        self.animationGroup.timingFunction = defaultCurve
        self.animationGroup.animations = [self.createOpacityAnimation(), self.createPathAnimation()]
    }
}

