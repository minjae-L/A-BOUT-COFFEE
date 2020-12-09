//
//  SideMenuViewController.swift
//  A-BOUT-COFFEE
//
//  Created by 이민재 on 11/11/2020.
//  Copyright © 2020 이민재. All rights reserved.
//

import UIKit
import Firebase

class SideMenuViewController: UIViewController {

    var ref: DocumentReference? = nil
    var subMenuName = ["홈", "바코드", "이벤트", "기프트샵", "제품", "가게"]
    var imageName = ["house", "barcode", "doc.text", "gift", "cube", "cart"]
    var image : UIImage?
    var username = UserDefaults.standard.string(forKey: "currentID")!

    
    
    func getUserNickname (email: String){
        let db = Firestore.firestore()
        let docRef = db.collection("User").document(email)
        docRef.getDocument {
            (document, error) in
            if let document = document, document.exists {
                UserDefaults.standard.set(document.get("nickname"), forKey: "currentNick")
                print(UserDefaults.standard.string(forKey: "currentNick"))
            } else {
                print("Document is not exist")
            }
        }
    }

    @IBOutlet weak var usernameLabel: UILabel!
    @IBAction func login(_ sender: Any) {
        let loginView = self.storyboard?.instantiateViewController(withIdentifier: "loginView")
        loginView?.modalPresentationStyle = .fullScreen
        loginView?.modalTransitionStyle = .coverVertical
        self.navigationController?.pushViewController(loginView!, animated: true)
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        print(username)
        if (username != "") {
            print("여기는? \(UserDefaults.standard.string(forKey: "currentNick"))")
            usernameLabel.text = "안녕하세요 \(UserDefaults.standard.string(forKey: "currentNick")) 님"
        } else {
           usernameLabel.text = "안녕하세요. 에이바우트 입니다."
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let nibName = UINib(nibName: "SubMenuTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "subMenuCell")
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight = 50
        
        super.viewDidLoad()
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200)
        self.navigationController?.navigationBar.barTintColor = .white
        view.backgroundColor = .gray
        // Do any additional setup after loading the view.
    }
    
    
    
    }

// MARK: - 사이드메뉴 테이블뷰
extension SideMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subMenuCell", for: indexPath) as! SubMenuTableViewCell
            cell.subMenuName.text = subMenuName[indexPath.row]
        image = UIImage(systemName: imageName[indexPath.row])
        cell.iconImage.image = image
        return cell
    }
}

extension SideMenuViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

