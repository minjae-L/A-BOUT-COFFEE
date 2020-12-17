//
//  SubMenuTableViewCell.swift
//  A-BOUT-COFFEE
//
//  Created by 이민재 on 12/11/2020.
//  Copyright © 2020 이민재. All rights reserved.
//

import UIKit

class SubMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var subMenuName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.lightGray.cgColor
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
