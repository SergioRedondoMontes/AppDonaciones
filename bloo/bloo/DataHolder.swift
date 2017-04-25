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
    
    static let sharedInstance:DataHolder=DataHolder()
    
    func initFireBase(){
        FIRApp.configure()
    }
    
}
