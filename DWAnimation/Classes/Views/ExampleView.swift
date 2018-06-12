//
//  ExampleView.swift
//  DWAnimation
//
//  Created by Dion Wu on 2018/6/12.
//  Copyright © 2018年 DionWu. All rights reserved.
//

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

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
