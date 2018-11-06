//
//  UserDefaultsExtension.swift
//  DeveloperSocialSite
//
//  Created by Chandrika Bajoria on 24/10/18.
//  Copyright © 2018 Chandrika Bajoria. All rights reserved.
//

import Foundation

extension UserDefaults
{
    enum UserDefaultsKey : String {
        case token
    }
    
    func setToken(value:String)
    {
        set(value, forKey:UserDefaultsKey.token.rawValue )
        synchronize()
    }
    
    func getToken() -> String?
    {
        return string(forKey: UserDefaultsKey.token.rawValue)
    }
    
    
}
