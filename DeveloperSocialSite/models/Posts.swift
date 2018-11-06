//
//  Posts.swift
//  DeveloperSocialSite
//
//  Created by Chandrika Bajoria on 25/10/18.
//  Copyright © 2018 Chandrika Bajoria. All rights reserved.
//

import Foundation

class Posts: Decodable  {
    //var comment : [String]? =
    var _id : String? = ""
    var text : String? = ""
    var name : String? = ""
    var avatar : String? = ""
    var user : String? = ""
    var likes : [Likes]? = [Likes]()
    var comments : [Comments]? = [Comments]()
      var comment : [Comments]? = [Comments]()
    var date : String? = ""
    var __v : Int? = 0


}
class Comments : Decodable {
    var _id : String? = ""
    var text : String? = ""
    var name : String? = ""
    var avatar : String? = ""
    var user : String? = ""
    var date : String? = ""
   

}

class Likes :Decodable  {
    var _id : String? = ""
    var user : String? = ""
    
}
