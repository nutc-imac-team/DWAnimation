//
//  InfinityVC.swift
//  DWAnimation
//
//  Created by Dion Wu on 2018/6/11.
//  Copyright © 2018年 DionWu. All rights reserved.
//

import UIKit

class InfinityVC: UIViewController {
    
    var pulsing: Pulsing!
    var circlePulsing: CirclePulsing!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func pulsingAnimation(repeatTimes: Float, duration: TimeInterval) {
        self.pulsing = Pulsing(position: self.view.center, toRadius: 50, color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        self.pulsing.animationDuration = duration
        self.pulsing.repeatTimes = repeatTimes
        self.view.layer.addSublayer(self.pulsing)
        
        self.circlePulsing = CirclePulsing(position: self.view.center, toRadius: 300, color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        self.circlePulsing.animationDuration = duration
        self.circlePulsing.repeatTimes = repeatTimes
        self.circlePulsing.fromRadius = 50
        self.view.layer.addSublayer(self.circlePulsing)
    }
    
    @IBAction func startAction(_ sender: UIButton) {
        self.pulsingAnimation(repeatTimes: Float.infinity, duration: 1)
    }
    
    @IBAction func stopAction(_ sender: UIButton) {
        self.pulsing.removeAllAnimations()
        self.circlePulsing.removeAllAnimations()
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
