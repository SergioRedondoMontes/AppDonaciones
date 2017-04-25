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

class VCLogIn: UIViewController, GIDSignInUIDelegate {
    

    @IBOutlet var txtfMail:UITextField?
    @IBOutlet var txtfPass:UITextField?
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       setudGoogleButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func btnLogIn() {
        // Inicio de sesion en FireBase
        FIRAuth.auth()?.signIn(withEmail: (txtfMail?.text)!, password: (txtfPass?.text)!) { (user, error) in
            
            if(error == nil){
                self.performSegue(withIdentifier: "transitionLogIn", sender: self)
                
            }else{
                // Aqui va un error :D
            }
            
            
        }
    }
    
    
    //crear boton google
    fileprivate func setudGoogleButtons(){
        let btnGoogle = GIDSignInButton()
        btnGoogle.frame = CGRect(x: 16, y:390 + 66, width: view.frame.width - 32, height:50)
        view.addSubview(btnGoogle)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
    }
    
}

