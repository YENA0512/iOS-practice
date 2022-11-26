//
//  SecondViewController.swift
//  week10
//
//  Created by 이예나 on 11/17/22.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressedDismiss(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {
            let transition = CATransition()
            transition.duration = 0.5
            transition.timingFunction =
            CAMediaTimingFunction(name:
                                    CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.reveal
            transition.subtype = CATransitionSubtype.fromRight
            self.view.window!.layer.add(transition, forKey: nil)
            self.dismiss(animated: false, completion: nil)
   
        })
    }
}
