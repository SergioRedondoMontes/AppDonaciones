//
//  Profile.swift
//  bloo
//
//  Created by Sergio Redondo on 25/5/17.
//  Copyright © 2017 AppBloo. All rights reserved.
//

import UIKit

class Profile: NSObject {
    
    var tokenPush:String?
    var email:String?
    var age:Int?
    var rol:String?
    
    init(valores:[String:Any]) {
        tokenPush = valores["tokenPush"] as? String
        email = valores["email"] as? String
        age = valores["age"] as? Int
        rol = valores["rol"] as? String
    }

}
