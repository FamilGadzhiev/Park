//
//  UserProfile.swift
//  Avionicus
//
//  Created by Фамил Гаджиев on 13.02.17.
//  Copyright © 2017 Фамил Гаджиев. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class UserProfile{
    
    public required init?(map: Map) {
        
    }
    
    init?(json: JSON) {
        
    }
    
    var profile_mail: String?
    var profile_name: String?
    var profile_weight: String?
    var profile_height: String?
    var profile_birthday: String?
    var profile_hr_max: String?
    var profile_sex: String?
    var profile_boat: String?
    var profile_avatar: String?
    var profile_photo: String?
    var profile_bib: String?
    var profile_sport_club: String?
    var last_date_profile: String?
    
    
    func mapping(map: Map) {
        
        profile_mail                <- map  ["profile_mail"]
        profile_name                <- map  ["profile_name"]
        profile_weight              <- map  ["profile_weight"]
        profile_height              <- map  ["profile_height"]
        profile_birthday            <- map  ["profile_birthday"]
        profile_hr_max              <- map  ["profile_hr_max"]
        profile_sex                 <- map  ["profile_sex"]
        profile_boat                <- map  ["profile_boat"]
        profile_avatar              <- map  ["profile_avatar"]
        profile_photo               <- map  ["profile_photo"]
        profile_bib                 <- map  ["profile_bib"]
        profile_sport_club          <- map  ["profile_sport_club"]
        last_date_profile           <- map  ["last_date_profile"]
        
    }
}
