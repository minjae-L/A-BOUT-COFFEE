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
    @IBOutlet weak var setNickname: UIButton!
    let getSavedId = UserDefaults.standard.string(forKey: "currentID")!
    
    func setNickname(nickname: String, currentEmail: String) {
        let db = Firestore.firestore()
        
        db.collection("User").whereField("username", isEqualTo: currentEmail).getDocuments() {(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print(document.documentID)
                    db.collection("User").document(document.documentID).updateData([
                        "username": currentEmail,
                        "nickname": nickname,
                        "ExistNickname": "true"
                    ]){ err in
                        if let err = err {
                            print("Error: \(err)")
                        } else {
                            print("Document successfully written!")
                        }
                    }
                }
            }
            
        }
    }
    @IBAction func settingNickname(_ sender: Any) {
        setNickname(nickname: nicknameField.text!,currentEmail: getSavedId)
//        self.navigationController?.popViewController(animated: true)
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
