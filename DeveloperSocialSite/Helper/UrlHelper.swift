//
//  File.swift
//  DeveloperSocialSite
//
//  Created by Chandrika Bajoria on 24/10/18.
//  Copyright © 2018 Chandrika Bajoria. All rights reserved.
//

import Foundation

struct UrlHelper {
    
    static let root : String = "http://localhost:5000/api/"
    static let login  : String = root + "users/login"
    static let register  : String = root + "users/register"
    static let post : String = root + "posts"
    static let likes : String = root + "posts/like/"
     static let unlikes : String = root + "posts/unlike/"
    static let comment : String = root + "posts/comment/"
    static let developers : String = root + "profile/all"
     static let profile : String = root + "profile/handle/"

  
}
