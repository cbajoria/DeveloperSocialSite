//
//  DevelopersProfileViewController.swift
//  DeveloperSocialSite
//
//  Created by Chandrika Bajoria on 06/11/18.
//  Copyright © 2018 Chandrika Bajoria. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DevelopersProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 

    @IBOutlet weak var tableview: UITableView!
    var developers : [Developer]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllDevelopers()
        tableview.separatorStyle = .none

        // Do any additional setup after loading the view.
        tableview.register(UINib(nibName: "DevlopersProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "developerProfileCell" )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return developers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "developerProfileCell", for: indexPath) as! DevlopersProfileTableViewCell
        cell.nameLbl.text = developers?[indexPath.row].user.name
        cell.designationLbl.text = (developers?[indexPath.row].status)! + " at " + (developers?[indexPath.row].company)!
        cell.locationLbl.text = developers?[indexPath.row].location
        cell.skillsLbl.text = developers?[indexPath.row].skills.joined(separator: ", ")
        
        
        return cell;
    }
    
    var selectedHandle : String?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedHandle = developers?[indexPath.row].handle
        performSegue(withIdentifier: "showProfile", sender: self)
    }
    
    func getAllDevelopers()
    {
        Alamofire.request(UrlHelper.developers, method: .get).responseData { (response) in
            do{
                print(UrlHelper.developers)
                print(response.result.value!)
                print(response.data!)
                self.developers = try JSONDecoder().decode([Developer].self ,from: response.data!)
                self.tableview.reloadData()
            }catch
            {
                print(error.localizedDescription)
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVc = segue.destination as! ProfileDetailViewController
        destinationVc.handle = selectedHandle
        
    }
    
    
}
