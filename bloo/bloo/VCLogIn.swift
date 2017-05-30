//
//  ViewController.swift
//  bloo
//
//  Created by Sergio Redondo on 25/4/17.
//  Copyright © 2017 AppBloo. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import  GoogleSignIn

class VCLogIn: UIViewController, GIDSignInUIDelegate,DataHolderDelegate {
    

    @IBOutlet var txtfMail:UITextField?
    @IBOutlet var txtfPass:UITextField?
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GIDSignIn.sharedInstance().uiDelegate = self
       
        DataHolder.sharedInstance.delegate=self
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func btnLogIn() {
       
        // Inicio de sesion en FireBase
        FIRAuth.auth()?.signIn(withEmail: (txtfMail?.text)!, password: (txtfPass?.text)!) { (user, error) in
            
            if(error == nil){
                
                  self.loadProfile(userID: (user?.uid)!)
                //self.performSegue(withIdentifier: "transitionLogIn", sender: self)
                
            }else{
                // Aqui va un error :D
            }
            
            
        }
    }
    
    func DataHolderUserLogIn(user: FIRUser) {
        //self.performSegue(withIdentifier: "transitionLogIn", sender: self)
        self.loadProfile(userID: (user.uid))
    }
    
    func loadProfile(userID:String)  {
        
        DataHolder.sharedInstance.firDataBaseRef.child("profiles").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            //let value = snapshot.value as? NSDictionary
            //let username = value?["username"] as? String ?? ""
            //let user = User.init(username: username)
            print("USER ID: ",userID)
            
            
            DataHolder.sharedInstance.miPerflie = Profile(valores: snapshot.value as! [String : Any])
            
            if(DataHolder.sharedInstance.miPerflie?.tokenPush==nil){
                print("************************************************************INSERT!!! ",DataHolder.sharedInstance.miPerflie?.tokenPush)
                DataHolder.sharedInstance.miPerflie?.tokenPush = DataHolder.sharedInstance.tokenUser
                
                if(DataHolder.sharedInstance.miPerflie?.tokenPush==nil){
                    
                    
                }
                else{
                    DataHolder.sharedInstance.firDataBaseRef.child("profiles").child(userID).child("tokenPush").setValue(DataHolder.sharedInstance.miPerflie?.tokenPush)
                }
                
                
                
                
            }
            
            self.performSegue(withIdentifier: "transitionLogIn", sender: self)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    

}

