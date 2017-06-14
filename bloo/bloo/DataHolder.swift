//
//  DataHolder.swift
//  bloo
//
//  Created by Sergio Redondo on 25/4/17.
//  Copyright © 2017 AppBloo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
//import GeoFire

class DataHolder: NSObject {
    
    var tokenUser:String?
    var googleMail:String?
    var userID:String?
    
    var delegate:DataHolderDelegate?
    
    static let sharedInstance:DataHolder=DataHolder()
    var userAuth:User?
    var firDataBaseRef: DatabaseReference!
//    var geoFireRef:DatabaseReference?
//    var geoFire:GeoFire?
    
    var miPerflie:Profile?
    
    func initFireBase(){
        FirebaseApp.configure()
        firDataBaseRef = Database.database().reference()
        
        Auth.auth().addStateDidChangeListener() { (auth, user) in
            if let user = user {
                // User is signed in.
                DataHolder.sharedInstance.userAuth=user
                self.delegate?.DataHolderUserLogIn(user: user)
//                self.geoFireRef = Database.database().reference().child("geolocs")
//                self.geoFire = GeoFire(firebaseRef: self.geoFireRef)
            } else {
                // No user is signed in.
            }
        }
    }
    
    
}

protocol DataHolderDelegate {
    func DataHolderUserLogIn(user:User)
}
