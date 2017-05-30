//
//  DataHolder.swift
//  bloo
//
//  Created by Sergio Redondo on 25/4/17.
//  Copyright © 2017 AppBloo. All rights reserved.
//

import UIKit
import  Firebase
import FirebaseStorage

class DataHolder: NSObject {
    
    var tokenUser:String?
    
    var delegate:DataHolderDelegate?
    
    static let sharedInstance:DataHolder=DataHolder()
    var userAuth:FIRUser?
    var firDataBaseRef: FIRDatabaseReference!
    
    var miPerflie:Profile?
    
    func initFireBase(){
        FIRApp.configure()
        firDataBaseRef = FIRDatabase.database().reference()
        
        FIRAuth.auth()?.addStateDidChangeListener() { (auth, user) in
            if let user = user {
                // User is signed in.
                DataHolder.sharedInstance.userAuth=user
                print("USER LOGEADO CON",user.email!)
                self.delegate?.DataHolderUserLogIn(user: user)
                //FIRAuth.auth()?.signOut()
                /*do {
                    try
                        FIRAuth.auth()?.signOut()
                } catch let signOutError as NSError {
                    print ("Error signing out: %@", signOutError)
                }*/
            } else {
                // No user is signed in.
            }
        }
    }
    
}

protocol DataHolderDelegate {
    func DataHolderUserLogIn(user:FIRUser)
}
