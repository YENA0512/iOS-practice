//
//  ViewController.swift
//  week10
//
//  Created by 이예나 on 11/17/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressedPlay(_sender: UIButton){
        UIView.animate(withDuration: 1.5, animations: {self.customView.backgroundColor = .blue},completion: {(_) in
            UIView.animate(withDuration: 1, animations: {
                self.customView.alpha = 0.1
            })

        })
       // self.present(SecondViewController(), animated: true, completion: nil)
        
    }
}
    @IBDesignable extension UIView {
        @IBInspectable var cornerRadius:CGFloat {
            set {
                layer.cornerRadius = newValue
                clipsToBounds = newValue > 0
                
            }
            get {
                return layer.cornerRadius
            }
        }
    }



