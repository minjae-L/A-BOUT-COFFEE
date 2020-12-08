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

    @IBOutlet weak var sideBarButton: UIBarButtonItem!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var subscriptionView: UIView!
    @IBOutlet weak var pass_orderView: UIView!
    @IBOutlet weak var giftView: UIView!
    
    override func viewDidLoad() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logo")
        imageView.image = image
        navigationItem.titleView = imageView
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.backgroundColor = .black
        super.viewDidLoad()
        
        cardView.layer.borderWidth = 0.5
        cardView.layer.borderColor = UIColor.gray.cgColor
        subscriptionView.layer.borderWidth = 0.5
        subscriptionView.layer.borderColor = UIColor.gray.cgColor
        pass_orderView.layer.borderWidth = 0.5
        pass_orderView.layer.borderColor = UIColor.gray.cgColor
        giftView.layer.borderWidth = 0.5
        giftView.layer.borderColor = UIColor.gray.cgColor
        
        // Do any additional setup after loading the view.
    }


}

