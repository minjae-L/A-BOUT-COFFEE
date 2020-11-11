//
//  CustomSideMenuNavigation.swift
//  A-BOUT-COFFEE
//
//  Created by 이민재 on 11/11/2020.
//  Copyright © 2020 이민재. All rights reserved.
//

import UIKit
import SideMenu

class CustomSideMenuNavigation: SideMenuNavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presentationStyle = .menuSlideIn
        self.menuWidth = self.view.frame.width * 0.7
        self.leftSide = true
        self.presentDuration = 0.7
        self.dismissDuration = 0.7
    }
}

//    //메뉴 나오는 스타일
//    self.presentationStyle = .menuSlideIn
//
//    //가로 크기 50퍼
//    self.menuWidth = self.view.frame.width * 0.5
//
//    //메뉴 왼쪽에서 나오기
//    self.leftSide = true
//
//    //상단 상태바 보이도록 설정 0 ( 0~1 default 1 )
//    self.statusBarEndAlpha = 0.0
//
//
//    //보여지는 속도
//    self.presentDuration = 1.0
//    //사라지는 속도
//    self.dismissDuration = 1.0

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */ 
