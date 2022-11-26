//
//  ViewController.swift
//  week7
//
//  Created by 이예나 on 11/9/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var IdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
//
//    @IBOutlet weak var LoginButton: UIButton!
//    @IBOutlet weak var SignupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func loginButtonDidTap(_ sender: Any) {
        guard let Id = IdTextField.text else {return}
        guard let password = passwordTextField.text else {
            return
        }
       
        if  UserDefaults.standard.string(forKey: Id) != nil {
            print("데이터 입력")
        } else if password != UserDefaults.standard.string(forKey: Id) {
            print("비밀번호 오류")
        } else if password == UserDefaults.standard.string(forKey: Id) {
            print("로그인 성공")
        }
    }
    
    @IBAction func signupButtonDidTap(_ sender: Any) {
        guard let SecondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        navigationController?.pushViewController(SecondViewController, animated: true)
    }
}

