//
//  CommentsViewController.swift
//  DeveloperSocialSite
//
//  Created by Chandrika Bajoria on 06/11/18.
//  Copyright © 2018 Chandrika Bajoria. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CommentsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    @IBOutlet weak var commentText: UITextView!
    @IBOutlet weak var tableview: UITableView!
    var post : Posts?
     var comments : [Comments]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.separatorStyle = .none
        // Do any additional setup after loading the view.
        tableview.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "commentCell")
        comments = post?.comments
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments?.count ?? 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell",for : indexPath) as! CommentTableViewCell
        cell.nameLbl.text = comments?[indexPath.row].name
        cell.commentLbl.text = comments?[indexPath.row].text
        return cell;
    }
    
    

    @IBAction func commentSubmitted(_ sender: UIButton)
    {
        if let token = UserDefaults.standard.getToken(){
            let headers: HTTPHeaders = [
                "Authorization": token,
                ]
            
        let param : [String : String] = ["text" : commentText.text]
            Alamofire.request(UrlHelper.comment+(post?._id)!, method: .post, parameters: param, headers: headers).validate().responseData {(response) in
                do{
                  self.post = try JSONDecoder().decode(Posts.self, from: response.data!)
                    self.comments = self.post?.comments
                }catch
                {
                    
                }
                self.commentText.text = ""
                self.tableview.reloadData()
            }
        }
        
    }
    
}
