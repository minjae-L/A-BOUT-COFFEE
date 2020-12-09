//
//  SetNicknameViewController.swift
//  A-BOUT-COFFEE
//
//  Created by 이민재 on 07/12/2020.
//  Copyright © 2020 이민재. All rights reserved.
//

import UIKit
import Firebase

class SetNicknameViewController: UIViewController {
    
    
    var ref: DocumentReference? = nil
    
    
    @IBOutlet weak var nicknameField: UITextField!
    
    let getSavedId = UserDefaults.standard.string(forKey: "currentID")!
    
    func setNickname(nickname: String, currentEmail: String) {
        
        let db = Firestore.firestore()
        let location = db.collection("User").document(currentEmail)
        let alert = UIAlertController(title: "닉네임 설정", message: "닉네임이 \(nickname)로 설정되었습니다.", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "확인", style: .default, handler: {
            (_) in
            self.navigationController?.popToRootViewController(animated: true)
        })
        alert.addAction(okBtn)
        
        print(nickname)
        print(currentEmail)
        
        location.updateData([
            "nickname": nickname
        ]){ err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
        
        self.present(alert, animated: true, completion: nil)
        
        self.nicknameField.text = ""
    }

    @IBAction func settingNickname(_ sender: Any) {
        setNickname(nickname: nicknameField.text!,currentEmail: getSavedId)
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
