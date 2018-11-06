//
//  ViewController.swift
//  DeveloperSocialSite
//
//  Created by Chandrika Bajoria on 18/10/18.
//  Copyright © 2018 Chandrika Bajoria. All rights reserved.
//

import UIKit
import  Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var emailId: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func loginClicked(_ sender: Any) {
        
        let passwordEntered = password.text
        let emailIdEntered = emailId.text
       // let parameter: Parameters = [ "email" :emailIdEntered!, "password" : passwordEntered! ]
         let parameter: Parameters = [ "email" :"cmbajoria1993@gmail.com", "password" : "Ch@ndrika" ]
        print(parameter)
        Alamofire.request(UrlHelper.login , method: HTTPMethod.post, parameters: parameter).responseJSON(completionHandler: { (response) in
            if let statuscode = response.response?.statusCode{
            switch statuscode
            {
            case 200:
                if let res = response.result.value
                {
                    var json = JSON(res);
                    let token = json["token"].string!
                    
                    UserDefaults.standard.setToken(value: token)
                    self.performSegue(withIdentifier: "ShowHomePage", sender: self)
                }
            case 400..<404:
                if let res = response.result.value
                {
                    var json = JSON(res);
                    let emailErr = json["email"].description
                    let passwordErr = json["password"].description
                    if emailErr != "null"
                    {
                        self.errorLabel.isHidden = false
                        self.errorLabel.text = emailErr
                    }
                    else if passwordErr != "null"
                    {
                        self.errorLabel.isHidden = false
                        self.errorLabel.text = passwordErr
                    }
                }
            default:
                self.errorLabel.isHidden = false
                self.errorLabel.text = response.error.debugDescription
                }
            }
        })
        
    }
    
}

