//
//  DataHolder.swift
//  bloo
//
//  Created by Sergio Redondo on 25/4/17.
//  Copyright © 2017 AppBloo. All rights reserved.
//

import UIKit
import  Firebase

class DataHolder: NSObject {
    
    var delegate:DataHolderDelegate?
    
    static let sharedInstance:DataHolder=DataHolder()
    var miUsuarioAuth:FIRUser?
    
    func initFireBase(){
        FIRApp.configure()
        
        FIRAuth.auth()?.addStateDidChangeListener() { (auth, user) in
            if let user = user {
                // User is signed in.
                DataHolder.sharedInstance.miUsuarioAuth=user
                print("USER LOGEADO CON",user.email!)
                self.delegate?.DataHolderUserYaLogeado(user: user)
            } else {
                // No user is signed in.
            }
        }
    }
    
}

protocol DataHolderDelegate {
    func DataHolderUserYaLogeado(user:FIRUser)
}
