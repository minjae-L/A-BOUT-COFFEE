//
//  SignUpViewController.swift
//  A-BOUT-COFFEE
//
//  Created by 이민재 on 07/12/2020.
//  Copyright © 2020 이민재. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwrdTextField: UITextField!
    @IBOutlet weak var passwrd2TextField: UITextField!
    
    var ref: DocumentReference? = nil
    var isSuccessSignUp = 0;
    @IBAction func signUpComplete(_ sender: Any) {
        doSignUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwrdTextField.delegate = self
        passwrd2TextField.delegate = self

    }
    func showAlert(message: String) {
        let alert = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func doSignUp() {
        if emailTextField.text! == "" {
            showAlert(message: "이메일을 입력해주세요")
            return
        }
        
        if passwrdTextField.text! == "" {
            showAlert(message: "비밀번호를 입력해주세요")
            return
        }
        
        if passwrd2TextField.text! == "" {
            showAlert(message: "비밀번호 확인을 입력해주세요")
            return
        }
        
        if passwrdTextField.text != passwrd2TextField.text {
            self.showAlert(message: "비밀번호가 다릅니다.")
            return
        }
        
        signUp(email: emailTextField.text!, password: passwrdTextField.text!)
    }
    
    
    func signUp(email: String, password: String) {
        let db = Firestore.firestore()
        Auth.auth().createUser(withEmail: email, password: password, completion: {(user, error) in
            if error != nil {
                if let errorCode = AuthErrorCode(rawValue: (error?._code)!) {
                    switch errorCode {
                    case AuthErrorCode.invalidEmail:
                        self.showAlert(message: "유효하지 않은 이메일입니다.")
                    case AuthErrorCode.emailAlreadyInUse:
                        self.showAlert(message: "이미 가입한 회원입니다.")
                    case AuthErrorCode.weakPassword:
                        self.showAlert(message: "비밀번호는 6자리 이상 입력해주세요.")
                    default:
                        print(errorCode)
                    }
                }
            }else {
                    db.collection("User").document(self.emailTextField.text!).setData([
                    "useremail": self.emailTextField.text ?? "",
                    "point": 0,
                    "subscription": false,
                    "isExistNickname": false,
                    "nickname" : ""
                ]) { err in
                    var alertTitle = "회원가입 완료"
                    var alertMessage = "회원가입이 완료되었습니다."
                    self.isSuccessSignUp = 1
                    if err != nil {
                        alertTitle = "회원가입 실패"
                        alertMessage = "회원가입에 실패하였습니다."
                        self.isSuccessSignUp = 0
                    }
                    
                    let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
                    let okButton = UIAlertAction(title: "확인", style: .default, handler: { (_) in
                        if self.isSuccessSignUp == 1 {
                            UserDefaults.standard.set(self.emailTextField.text!, forKey: "currentID")
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "setNicknameView")
                                self.navigationController?.pushViewController(vc!, animated: true)
//                          self.navigationController?.popViewController(animated: true)
                        }
                    })
                    alertController.addAction(okButton)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        })
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

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
