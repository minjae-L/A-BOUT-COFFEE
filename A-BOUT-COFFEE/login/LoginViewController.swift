//
//  LoginViewController.swift
//  A-BOUT-COFFEE
//
//  Created by 이민재 on 06/12/2020.
//  Copyright © 2020 이민재. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    var isLogining = 0
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwrdTextField: UITextField!
    
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBAction func login(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwrdTextField.text!){
            (user, error) in
            if user != nil{
                print("login success")
                self.isLogining = 1
                UserDefaults.standard.set(self.isLogining, forKey: "chekingLogin")
                self.navigationController?.popViewController(animated: true)
            } else {
                print("login fail")
                self.isLogining = 0
                UserDefaults.standard.set(self.isLogining, forKey: "chekingLogin")
                let alert = UIAlertController(title:  "로그인 실패", message: "아이디 또는 패스워드를 확인해주세요.", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
                
                self.emailTextField.text = ""
                self.passwrdTextField.text = ""
            }
        }
//        let alertController = UIAlertController(title: "로그인", message: "로그인", preferredStyle: .alert)
        
//        let yesButton = UIAlertAction(title: "예", style: .default, handler: { _ in
//            print("Yes")
//
//        })
//        let noButton = UIAlertAction(title: "아니오", style: .default, handler: nil)
//        alertController.addAction(yesButton)
//        alertController.addAction(noButton)
        
//        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func signupBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "signupView")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
