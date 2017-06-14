//
//  VCAdmin.swift
//  bloo
//
//  Created by Sergio Redondo on 4/5/17.
//  Copyright © 2017 AppBloo. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class VCAdmin: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func LogOut(){
        
        let firebaseAuth = Auth.auth()
        do {
            try
                firebaseAuth.signOut()
            GIDSignIn.sharedInstance().signOut()
            performSegue(withIdentifier: "transitionLogOutAdmin", sender: self)
        } catch let signOutError as NSError {
           //Error signing out: %@", signOutError
        }
        
    }

}
