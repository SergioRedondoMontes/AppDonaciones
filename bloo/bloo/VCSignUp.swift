//
//  VCSingUp.swift
//  bloo
//
//  Created by Sergio Redondo on 25/4/17.
//  Copyright © 2017 AppBloo. All rights reserved.
//

import UIKit
import FirebaseAuth

class VCSignUp: UIViewController {

    @IBOutlet var txtfRegMail:UITextField?
    @IBOutlet var txtfRegReMail:UITextField?
    @IBOutlet var txtfRegPass:UITextField?
    @IBOutlet var txtfRegRePass:UITextField?
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// Metodo para el boton registrar
    
    
    @IBAction func btnSignUp() {
        // Creacion de usuario en FireBase
        FIRAuth.auth()?.createUser(withEmail: (txtfRegMail?.text)!, password: (txtfRegPass?.text)! ) { (user, error) in
            
            if(error == nil){
                self.performSegue(withIdentifier: "transitionSignUp", sender: self)
                
            }else{
            // Aqui va un error :D
            }
            
      
        }
        
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
