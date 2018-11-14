//
//  ProfileDetailViewController.swift
//  DeveloperSocialSite
//
//  Created by Chandrika Bajoria on 09/11/18.
//  Copyright © 2018 Chandrika Bajoria. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class ProfileDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    var handle : String?
    var developer : Developer?
    var sectionTitle = ["Skills","Education","Experience"]
    var items = [] as [Any] //[[skills],[eduction],[experience]]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        getProfileData()
        tableview.estimatedRowHeight = 150
        tableview.rowHeight = UITableViewAutomaticDimension
        tableview.sectionHeaderHeight = 70
        tableview.separatorStyle = .none
        tableview.register(ProfileTableViewCell.nib, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tableview.register(EducationTableViewCell.nib, forCellReuseIdentifier: EducationTableViewCell.identifier)
        tableview.register(SkillsTableViewCell.nib, forCellReuseIdentifier: SkillsTableViewCell.identifier)
    }

   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
            print("index = \(indexPath.row) section = \(indexPath.section)")
      

        if indexPath.section == 0
        {
            if  let itemSkills =  items[indexPath.section] as? [String]
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: SkillsTableViewCell.identifier , for: indexPath) as! SkillsTableViewCell
                cell.skills.text = itemSkills[indexPath.row]
                return cell

            }
        }
        else if indexPath.section == 1
        {
            if let itemEdu =  items[indexPath.section] as? [Education]
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: EducationTableViewCell.identifier , for: indexPath) as! EducationTableViewCell
                cell.itemEdu = itemEdu[indexPath.row]
                return cell
            }
        }
        else if indexPath.section == 2
        {
            if  let itemExp =  items[indexPath.section] as? [Experience]
            {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier , for: indexPath) as! ProfileTableViewCell
            cell.item = itemExp[indexPath.row]
            return cell

            }
       }
       
        return UITableViewCell()
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
         var count = ((items[section]) as AnyObject).count
        return count!  // 5, 1 , 2  -- skills,education,experience
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  items.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sectionTitle[section]
    }
    
    func getProfileData()  {
        Alamofire.request(UrlHelper.profile + handle!, method: .get).responseData { (
            response) in
            do{
                self.developer = try JSONDecoder().decode(Developer.self, from: response.data!)
               self.items.append(self.developer?.skills! as Any)
                self.items.append(self.developer?.education! as Any)
               self.items.append(self.developer?.experience! as Any)
              
                self.tableview.reloadData()
                
            }catch{
                print(error.localizedDescription)
            }
        }
        
    }
}


