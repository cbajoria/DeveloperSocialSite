//
//  SignUpViewController.swift
//  DeveloperSocialSite
//
//  Created by Chandrika Bajoria on 24/10/18.
//  Copyright © 2018 Chandrika Bajoria. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignUpViewController: UIViewController {

   
    @IBOutlet weak var nameError: UILabel!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passError: UILabel!
    @IBOutlet weak var confPassError: UILabel!
    
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var emailId: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitClicked(_ sender: Any)
    {
        
        let parameter : Parameters = [ "name": username.text ?? "",
                                       "email": emailId.text ?? "",
                                       "password": password.text ?? "",
                                       "password2": confirmPassword.text ?? ""]
        Alamofire.request(UrlHelper.register, method: HTTPMethod.post, parameters: parameter).responseJSON
            { (response) in
            
                if let statuscode = response.response?.statusCode{
                    switch statuscode
                    {
                    case 200:
                        if let res = response.result.value
                        {
                           print("successfully Registered")
                            print(res)
                        }
                    case 400..<404:
                        if let res = response.result.value
                        {
                            var json = JSON(res);
                            let emailErr = json["email"].description
                            let passwordErr = json["password"].description
                            let nameErr = json["name"].description
                            let confirmPasswordErr = json["password2"].description
                            
                            if emailErr != "null"
                            {
                                self.emailError.isHidden = false
                                self.emailError.text = emailErr
                            }
                             if passwordErr != "null"
                            {
                                self.passError.isHidden = false
                                self.passError.text = passwordErr
                            }
                            if nameErr != "null"
                            {
                                self.nameError.isHidden = false
                                self.nameError.text = nameErr
                            }
                             if confirmPasswordErr != "null"
                            {
                                self.confPassError.isHidden = false
                                self.confPassError.text = confirmPasswordErr
                            }
                        }
                        
                        
                    default:
                        print(response.error.debugDescription)
                        
                    }
                }
            }
        
    }
    
    
}
