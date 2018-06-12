//
//  NormalVC.swift
//  DWAnimation
//
//  Created by Dion Wu on 2018/6/11.
//  Copyright © 2018年 DionWu. All rights reserved.
//

import UIKit

class NormalVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func pulsingAction(_ sender: UIButton) {
        let pulsing = Pulsing(position: self.view.center, toRadius: 50, color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        pulsing.animationDuration = 2
        self.view.layer.addSublayer(pulsing)
    }
    
    @IBAction func circlePulsingAction(_ sender: UIButton) {
        let circlePulsing = CirclePulsing(position: self.view.center, toRadius: 300, color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        circlePulsing.animationDuration = 2
        circlePulsing.fromRadius = 50
        self.view.layer.addSublayer(circlePulsing)
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
