//
//  NewsFeedViewController.swift
//  DeveloperSocialSite
//
//  Created by Chandrika Bajoria on 24/10/18.
//  Copyright © 2018 Chandrika Bajoria. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NewsFeedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var newsText: UITextView!
    var posts : [Posts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.separatorStyle = .none
        tableview.rowHeight = UITableViewAutomaticDimension
        tableview.estimatedRowHeight = 120.0
        posts = [Posts]()
        getPostData();
        tableview.register(UINib(nibName:"FeedTableViewCell", bundle: nil) , forCellReuseIdentifier: "FeedCell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitNewFeed(_ sender: UIButton)
    {
        let paramater : Parameters = ["text" :  newsText.text ?? ""]
        
        
        if let token = UserDefaults.standard.getToken(){
        let headers: HTTPHeaders = [
            "Authorization": token,
            ]
            
        Alamofire.request(UrlHelper.post, method: .post, parameters: paramater,headers:headers).responseJSON{
            (response) in
            if response.response?.statusCode == 200
            {
                print("successfull")
                self.newsText.text = ""
                self.getPostData()
                self.tableview.reloadData()
            }else{
                print(response.error.debugDescription)
            }
        }
    }
}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedTableViewCell
        cell.feedLbl.text = posts[indexPath.row].text
        cell.dateLbl.text = convertDate(dateFromJSON: posts[indexPath.row].date!)
        let likescount = String(posts[indexPath.row].likes?.count ?? 0)
        cell.likeButn.setTitle(likescount, for: UIControlState.normal)
        cell.likeButn.tag = indexPath.row
        cell.likeButn.addTarget(self,action:#selector(self.likeClicked(_:)),  for: UIControlEvents.touchUpInside)
        cell.unlikeBtn.addTarget(self, action:#selector(self.unlikeClicked(_:)), for: .touchUpInside)
        return cell;
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showComments", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
     @objc func unlikeClicked(_ sender : UIButton)  {
        
        let postId = self.posts[sender.tag]._id!
        
        if let token = UserDefaults.standard.getToken(){
            let headers: HTTPHeaders = [
                "Authorization": token,
                ]
             Alamofire.request(UrlHelper.unlikes+postId, method: .post,headers: headers).validate().responseData { (response) in
                
                do{
                    let postUpdate = try JSONDecoder().decode(Posts.self, from: response.data!)
                    if (postUpdate.likes != nil){
                        self.posts[sender.tag].likes = postUpdate.likes
                        self.tableview.reloadData()
                    }
                }catch
                {
                    
                }
            }
        }
    }
    
    @objc func likeClicked(_ sender : UIButton)  {
      
        let postId = self.posts[sender.tag]._id!
            
            if let token = UserDefaults.standard.getToken(){
                let headers: HTTPHeaders = [
                    "Authorization": token,
                    ]
                Alamofire.request(UrlHelper.likes+postId, method: .post,headers: headers).validate().responseData { (response) in
                    
                    do{
                        let postUpdate = try JSONDecoder().decode(Posts.self, from: response.data!)
                        if (postUpdate.likes != nil){
                        self.posts[sender.tag].likes = postUpdate.likes
                        self.tableview.reloadData()
                        }
                    }catch
                    {
                        
                    }
                }
            }
        
    }
    
    func convertDate(dateFromJSON : String) -> String
    {
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: dateFromJSON)
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        dateFormatter.locale = tempLocale // reset the locale
        let dateString = dateFormatter.string(from: date!)
        print("EXACT_DATE : \(dateString)")
        return dateString
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func getPostData()
    {
        if let token = UserDefaults.standard.getToken(){
            let headers: HTTPHeaders = [
                "Authorization": token,
                ]
            Alamofire.request(UrlHelper.post, method: .get,headers:headers).responseData{
                (response) in
                if response.response?.statusCode == 200
                {
                    do{
                        self.posts = try JSONDecoder().decode([Posts].self, from: response.data!)
                    }catch
                    {
                        print(error)
                    }
                    self.tableview.reloadData()
              }
           }
        }
    }
    
}
