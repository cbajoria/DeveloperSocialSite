//
//  Developer.swift
//  DeveloperSocialSite
//
//  Created by Chandrika Bajoria on 06/11/18.
//  Copyright © 2018 Chandrika Bajoria. All rights reserved.
//

import Foundation
public struct Developer  : Decodable{
    public var v : Int!
    public var id : String!
    public var bio : String!
    public var company : String!
    public var date : String!
    public var education : [Education]!
    public var experience : [Experience]!
    public var githubusername : String!
    public var handle : String!
    public var location : String!
    public var skills : [String]!
    public var social : Social!
    public var status : String!
    public var user : User!
    public var website : String!
}

public struct User :Decodable{
    public var id : String!
    public var avatar : String!
    public var name : String!
}


public struct Social :Decodable{
    public var facebook : String!
    public var instagram : String!
    public var twitter : String!
}


public struct Experience :Decodable{
    public var id : String!
    public var company : String!
    public var current : Bool!
    public var descriptionField : String!
    public var from : String!
    public var location : String!
    public var title : String!
    public var to : String!
}

public struct Education:Decodable {
    public var id : String!
    public var current : Bool!
    public var degree : String!
    public var descriptionField : String!
    public var fieldofstudy : String!
    public var from : String!
    public var school : String!
    public var to : String!
}

