//
//  ViewController.swift
//  A-BOUT-COFFEE
//
//  Created by 이민재 on 10/11/2020.
//  Copyright © 2020 이민재. All rights reserved.
//
    
//#import "SWRevealViewController.h"

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var sideBarButton: UIBarButtonItem!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var subscriptionView: UIView!
    @IBOutlet weak var pass_orderView: UIView!
    @IBOutlet weak var giftView: UIView!
    @IBOutlet weak var mainMsg: UILabel!
    
    var username = UserDefaults.standard.string(forKey: "currentID")!
    
    override func viewDidLoad() {
//        MARK: - 네이게이션 바 로고 이미지
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logo_white")
        imageView.image = image
        navigationItem.titleView = imageView
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.backgroundColor = .black

        
//        MARK: - 기본셋팅
        cardView.layer.borderWidth = 0.5
        cardView.layer.borderColor = UIColor.gray.cgColor
        subscriptionView.layer.borderWidth = 0.5
        subscriptionView.layer.borderColor = UIColor.gray.cgColor
        pass_orderView.layer.borderWidth = 0.5
        pass_orderView.layer.borderColor = UIColor.gray.cgColor
        giftView.layer.borderWidth = 0.5
        giftView.layer.borderColor = UIColor.gray.cgColor
        mainMsg.text = "안녕하세요 에이바우트입니다."
        mainMsg.textAlignment = .center
        mainMsg.font = .systemFont(ofSize: 20, weight: .bold)
        mainMsg.textColor = .gray
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        MARK: - 메인메뉴 upper view
        if(username != "") {
            let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200 , height: 200))
            let image =  UIImage(named: "upperIcon_white")
            imgView.image = image
            imgView.layer.position = CGPoint(x: self.upperView.bounds.width / 6, y: self.upperView.bounds.height / 2)
            self.upperView.addSubview(imgView)
            
            let font = UIFont(name: "Noto Sans CJK KR", size: 25)
            let upper_btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100  , height: 100))
            let atr: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font : font,
                NSAttributedString.Key.foregroundColor : UIColor.white,
                NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue]
            let str = NSMutableAttributedString(string: "로그인",attributes: atr)
            
            upper_btn.setAttributedTitle(str, for: .normal)
            
            upper_btn.layer.position = CGPoint(x: self.upperView.bounds.width / 1.5, y: self.upperView.bounds.height / 2)
            self.upperView.addSubview(upper_btn)
        }
    }


}

