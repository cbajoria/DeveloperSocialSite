////
////  ProfileViewModel.swift
////  DeveloperSocialSite
////
////  Created by Chandrika Bajoria on 12/11/18.
////  Copyright © 2018 Chandrika Bajoria. All rights reserved.
////
//
//import Foundation
//import Alamofire
//import sw
//
//
//enum ProfileViewModelItemType {
//    case experience
//    case education
//    case skills
//}
//
//protocol ProfileViewModelItem {
//    var type: ProfileViewModelItemType { get }
//    var sectionTitle: String { get }
//    var rowCount: Int { get }
//    var isCollapsible: Bool { get }
//    var isCollapsed: Bool { get set }
//}
//
//extension ProfileViewModelItem {
//    var rowCount: Int {
//        return 1
//    }
//    
//    var isCollapsible: Bool {
//        return true
//    }
//}
//
//class ProfileViewModel: NSObject {
//    var items = [ProfileViewModelItem]()
//    
//    var reloadSections: ((_ section: Int) -> Void)?
//    
//    override init() {
//        super.init()
//        guard let data = dataFromFile("ServerData"), let profile = Developer(data: data) else {
//            return
//        }
//        
//        if let name = profile.fullName, let pictureUrl = profile.pictureUrl {
//            let nameAndPictureItem = ProfileViewModelNamePictureItem(name: name, pictureUrl: pictureUrl)
//            items.append(nameAndPictureItem)
//        }
//        
//        if let about = profile.about {
//            let aboutItem = ProfileViewModelAboutItem(about: about)
//            items.append(aboutItem)
//        }
//        
//        if let email = profile.email {
//            let dobItem = ProfileViewModelEmailItem(email: email)
//            items.append(dobItem)
//        }
//        
//        let attributes = profile.profileAttributes
//        if !attributes.isEmpty {
//            let attributesItem = ProfileViewModeAttributeItem(attributes: attributes)
//            items.append(attributesItem)
//        }
//        
//        let friends = profile.friends
//        if !profile.friends.isEmpty {
//            let friendsItem = ProfileViewModeFriendsItem(friends: friends)
//            items.append(friendsItem)
//        }
//    }
//    func getProfileData() -> Developer {
//        Alamofire.request(UrlHelper.profile + handle!, method: .get).responseData { (
//            response) in
//            do{
//                var developer = try JSONDecoder().decode(Developer.self, from: response.data!)
//                return developer
//                
//            }catch{
//                print(error.localizedDescription)
//            }
//        }
//        
//    }
//}
