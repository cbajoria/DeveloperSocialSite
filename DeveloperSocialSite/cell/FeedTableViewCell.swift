//
//  FeedTableViewCell.swift
//  DeveloperSocialSite
//
//  Created by Chandrika Bajoria on 22/10/18.
//  Copyright © 2018 Chandrika Bajoria. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    @IBOutlet weak var feedLbl: UILabel!
    
    @IBOutlet weak var unlikeBtn: UIButton!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var likeButn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   
}
