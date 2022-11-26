//
//  SecondViewController.swift
//  week7
//
//  Created by 이예나 on 11/9/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var IdSignupTextField: UITextField!
    @IBOutlet weak var PasswordSignupTextField: UITextField!
//    @IBOutlet weak var SignupButton: UIButton!
//    @IBOutlet weak var CancelButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupButtonDidTap(_ sender: Any) {
        guard let Id = IdSignupTextField.text else {
            return
        }
        guard let password = PasswordSignupTextField.text else {
            return
        }
        UserDefaults.standard.set(password, forKey: Id)
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func cancelButtonDidTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
