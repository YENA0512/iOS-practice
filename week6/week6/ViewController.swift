//
//  ViewController.swift
//  week6
//
//  Created by 이예나 on 10/31/22.
//

import UIKit

class ViewController: UIViewController {
    
 
    @IBOutlet weak var SecondView: UIView!
    
    @IBOutlet weak var FirstView: UIView!
    var colorList: [UIColor] = [
        .blue,
        .brown,
        .systemPink,
        .red,
        .yellow,
        .green,
        .lightText,
        .black
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0 ..< 100 {
            print(i)
            //usleep(1000000)
        }
//        for i in (0 ..<100).reversed() {
//            print(i)
//            usleep(1000000)
//        }
        threadTest()
        // Do any additional setup after loading the view.
    }

    func threadTest(){
        DispatchQueue.global().async{
            for color in self.colorList {
                DispatchQueue.main.sync {
                    self.FirstView.backgroundColor = color
                }
                sleep(1)
            }
    }
        DispatchQueue.global().async{
            for color in self.colorList.reversed() {
                DispatchQueue.main.sync {
                    self.SecondView.backgroundColor = color
                }
            sleep(1)
            }
    }

    }
}
