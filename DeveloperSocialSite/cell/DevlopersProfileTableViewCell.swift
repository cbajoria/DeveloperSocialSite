//
//  DevlopersProfileTableViewCell.swift
//  DeveloperSocialSite
//
//  Created by Chandrika Bajoria on 31/10/18.
//  Copyright © 2018 Chandrika Bajoria. All rights reserved.
//

import UIKit

class DevlopersProfileTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var designationLbl: UILabel!
    
    @IBOutlet weak var locationLbl: UILabel!
    
    @IBOutlet weak var skillsLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
