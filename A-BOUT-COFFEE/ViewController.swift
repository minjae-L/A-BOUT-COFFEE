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
    
    override func viewDidLoad() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logo")
        imageView.image = image
        navigationItem.titleView = imageView
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.backgroundColor = .black
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

