//
//  ProfileTableViewCell.swift
//  DeveloperSocialSite
//
//  Created by Chandrika Bajoria on 09/11/18.
//  Copyright © 2018 Chandrika Bajoria. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
 
    @IBOutlet weak var descriptionValue: UILabel!
    @IBOutlet weak var descriptionKey: UILabel!
    @IBOutlet weak var locationValue: UILabel!
    @IBOutlet weak var locationKey: UILabel!
    @IBOutlet weak var positionValue: UILabel!
    @IBOutlet weak var positionKey: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!
    
    
    var item: Experience?  {
        didSet {
           companyLbl.text = item?.company
            //dateLbl.text = (item?.from)! + "to" + (item?.to)!
            positionKey.text = "Position"
            positionValue.text = item?.title
            locationKey.text = "Location"
            locationValue.text = item?.location
            descriptionKey.text = "Description"
            descriptionValue.text = item?.descriptionField
            
         }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
