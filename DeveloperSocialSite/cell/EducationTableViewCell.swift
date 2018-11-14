//
//  EducationTableViewCell.swift
//  DeveloperSocialSite
//
//  Created by Chandrika Bajoria on 14/11/18.
//  Copyright © 2018 Chandrika Bajoria. All rights reserved.
//

import UIKit

class EducationTableViewCell: UITableViewCell {

    @IBOutlet weak var collegName: UILabel!
    @IBOutlet weak var degreeValue: UILabel!
    @IBOutlet weak var degreeKey: UILabel!
    @IBOutlet weak var fieldOfStudyKey: UILabel!
    @IBOutlet weak var fieldOfStudyValue: UILabel!
    @IBOutlet weak var descValue: UILabel!
    @IBOutlet weak var descKey: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    var itemEdu: Education?  {
        didSet {
            collegName.text = itemEdu?.school
            //dateLbl.text = (item?.from)! + "to" + (item?.to)!
            degreeKey.text = "Degree"
            degreeValue.text = itemEdu?.degree
            fieldOfStudyKey.text = "Field Of Study"
            fieldOfStudyValue.text = itemEdu?.fieldofstudy
            descKey.text = "Description"
            descValue.text = itemEdu?.descriptionField
            
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
