//
//  VCSingUp.swift
//  bloo
//
//  Created by Sergio Redondo on 25/4/17.
//  Copyright © 2017 AppBloo. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class VCSignUp: UIViewController,UITextFieldDelegate {

    @IBOutlet var txtfRegMail:UITextField?
    @IBOutlet var txtfRegPass:UITextField?
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet var viewAger:ViewAger?
    
    var estado1:CGRect?
    var estado2:CGRect?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        estado1=viewAger?.frame
        estado2=viewAger?.frame
        estado2?.origin.y=(estado1?.origin.y)! - (estado1?.size.height)!
        // Do any additional setup after loading the view.
    
        viewAger?.btnDone?.addTarget(self, action: #selector(self.pressedBtnDone), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// Metodo para el boton registrar
    
    
    @IBAction func btnSignUp() {
        // Creacion de usuario en FireBase
        Auth.auth().createUser(withEmail: (txtfRegMail?.text)!, password: (txtfRegPass?.text)! ) { (user, error) in
            
            if(error == nil){
                
                Database.database().reference().child("profiles").child((user?.uid)!).child("mail").setValue(user?.email)
                Database.database().reference().child("profiles").child((user?.uid)!).child("age").setValue("0")
                //adminRol = 1; userRol = 0;
                Database.database().reference().child("profiles").child((user?.uid)!).child("rol").setValue("0")
                DataHolder.sharedInstance.miPerflie?.tokenPush = DataHolder.sharedInstance.tokenUser
                
                if(DataHolder.sharedInstance.miPerflie?.tokenPush==nil){
                    
                    
                }
                else{
                    DataHolder.sharedInstance.firDataBaseRef.child("profiles").child((user?.uid)!).child("tokenPush").setValue(DataHolder.sharedInstance.miPerflie?.tokenPush)
                }
                
                
                self.performSegue(withIdentifier: "transitionSignUp", sender: self)
                
                
            }else{
            // Aqui va un error :D
            }
            
      
        }
        
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        viewAger?.frame = estado1!
        UIView.animate(withDuration: 0.4, delay: 0.05, options: UIViewAnimationOptions.curveEaseIn, animations:{ () -> Void in
            
            self.viewAger?.frame = self.estado2!
            
        }
            , completion: { (finished) -> Void in
                
        })
    }

    
    func pressedBtnDone(sender: UIButton!) {
        viewAger?.frame = estado2!
        UIView.animate(withDuration: 0.4, delay: 0.05, options: UIViewAnimationOptions.curveEaseIn, animations:{ () -> Void in
            
            self.viewAger?.frame = self.estado1!
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM, yyyy"
            self.txtAge.text = dateFormatter.string(from: (self.viewAger?.uiDatePicker?.date)!)
            
            
        }
            , completion: { (finished) -> Void in
                
        })
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
