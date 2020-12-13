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

    
    @IBOutlet weak var isSub: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var pointLabel: UILabel!
    
    var ref: DocumentReference? = nil
    var subMenuName = ["홈", "바코드", "이벤트", "기프트샵", "제품", "가게"]
    var imageName = ["house", "barcode", "doc.text", "gift", "cube", "cart"]
    var image : UIImage?
    var username = UserDefaults.standard.string(forKey: "currentID")!
    var userNickname : String?
    
    
    func getUserNickname (email: String){
        let db = Firestore.firestore()
        
        db.collection("User").document(email).getDocument {
            (snapshot, err) in
            if let err = err {
                print("Error getting documents \(err)")
            } else {
                if let nickname = snapshot?.get("nickname") as? String {
                    print(nickname)
                    self.usernameLabel.text = "안녕하세요. \(nickname) 님"
                }
                if let subscription = snapshot?.get("subscription") as? Bool {
                    print(subscription)
                    if (subscription == true) {
                        self.isSub.text = "구독중"
                        self.isSub.textColor = UIColor.green
                    } else {
                        self.isSub.text = "미구독"
                        self.isSub.textColor = UIColor.red
                    }
                }
                if let point = snapshot?.get("point") as? Int {
                    print(point)
                    self.pointLabel.text = "포인트 : \(point)"
                }
            }
        }
    }

    @IBOutlet weak var usernameLabel: UILabel!
    @IBAction func login(_ sender: Any) {
        if (username == "") {
            let loginView = self.storyboard?.instantiateViewController(withIdentifier: "loginView")
            loginView?.modalPresentationStyle = .fullScreen
            loginView?.modalTransitionStyle = .coverVertical
            self.navigationController?.pushViewController(loginView!, animated: true)
        } else {
            let alert = UIAlertController(title: "로그아웃", message: "로그아웃 하시겠습니까?", preferredStyle: .alert)
            let ok = UIAlertAction(title: "예", style: .default, handler: { (_) in
                UserDefaults.standard.set("", forKey: "currentID")
                let confirmLogoutAlert = UIAlertController(title: "로그아웃", message: "로그아웃되었습니다.", preferredStyle: .alert)
                self.loginBtn.setTitle("로그인", for: .normal)
                self.usernameLabel.text = "로그인 해주세요."
                self.isSub.text = ""
                self.pointLabel.text = ""
                let confirm = UIAlertAction(title: "확인", style: .default, handler: { (_) in
                    self.dismiss(animated: true, completion: nil)
                })
                confirmLogoutAlert.addAction(confirm)
                self.present(confirmLogoutAlert, animated: true, completion:  nil)
            })
            let no = UIAlertAction(title: "아니오", style: .default, handler: nil)
            alert.addAction(ok)
            alert.addAction(no)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        isSub.textAlignment = .right
        usernameLabel.textAlignment = .right
        usernameLabel.textColor = .white
        usernameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        pointLabel.textAlignment = .right
        pointLabel.textColor = .white
        if (username != "") {
            getUserNickname(email: username)
            loginBtn.setTitle("로그아웃", for: .normal)
        } else {
            usernameLabel.text = "로그인 해주세요."
            loginBtn.setTitle("로그인", for: .normal)
            isSub.text = ""
            pointLabel.text = ""
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

