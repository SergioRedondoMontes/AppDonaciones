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
       
        //FireBase sign in
        Auth.auth().signIn(withEmail: (txtfMail?.text)!, password: (txtfPass?.text)!) { (user, error) in
            
            if(error == nil){
                
                  self.loadProfile(userID: (user?.uid)!)
                
            }else{
                //Label error
            }
            
            
        }
    }
    
    func DataHolderUserLogIn(user: User) {
        self.loadProfile(userID: (user.uid))
    }
    
    func loadProfile(userID:String)  {
        
        DataHolder.sharedInstance.firDataBaseRef.child("profiles").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
            DataHolder.sharedInstance.userID = userID
            
            if(snapshot.exists()){
                DataHolder.sharedInstance.miPerflie = Profile(valores: snapshot.value as! [String : Any])
                
                if(DataHolder.sharedInstance.miPerflie?.tokenPush==nil){
                    DataHolder.sharedInstance.miPerflie?.tokenPush = DataHolder.sharedInstance.tokenUser
                    
                    if(DataHolder.sharedInstance.miPerflie?.tokenPush==nil){
                        
                        
                    }
                    else{
                        DataHolder.sharedInstance.firDataBaseRef.child("profiles").child(userID).child("tokenPush").setValue(DataHolder.sharedInstance.miPerflie?.tokenPush)
                    }
                    
                }else{
                    DataHolder.sharedInstance.miPerflie?.tokenPush = DataHolder.sharedInstance.tokenUser
                    DataHolder.sharedInstance.firDataBaseRef.child("profiles").child(userID).child("tokenPush").setValue(DataHolder.sharedInstance.miPerflie?.tokenPush)
                }
                if(DataHolder.sharedInstance.miPerflie?.rol == "1"){
                    //1 Admin, 0 user
                    self.performSegue(withIdentifier: "transitionAdmin", sender: self)
                 }else{
                    self.performSegue(withIdentifier: "transitionLogIn", sender: self)
                 }
                
                
            }
            else{
                //create profile
                let googleMail = DataHolder.sharedInstance.googleMail
                Database.database().reference().child("profiles").child(userID).child("mail").setValue(googleMail)
                Database.database().reference().child("profiles").child(userID).child("age").setValue("0")
                //adminRol = 1; userRol = 0;
                Database.database().reference().child("profiles").child(userID).child("rol").setValue("0")
                DataHolder.sharedInstance.firDataBaseRef.child("profiles").child(userID).child("tokenPush").setValue(DataHolder.sharedInstance.miPerflie?.tokenPush)
                self.performSegue(withIdentifier: "transitionLogIn", sender: self)
            }
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    

}

