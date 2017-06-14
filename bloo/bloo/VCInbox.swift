//
//  VCInbox.swift
//  bloo
//
//  Created by Sergio Redondo on 25/4/17.
//  Copyright © 2017 AppBloo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseMessaging
import CoreLocation
class VCInbox: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    /*
                Under construction
    
      let lat:CLLocationDegrees = 40.538629
        let lon:CLLocationDegrees = -3.893751
      let myLocation:CLLocation = CLLocation (latitude: lat, longitude: lon)
        
       DataHolder.sharedInstance.geoFire?.setLocation(myLocation, forKey: DataHolder.sharedInstance.userID)
 */
        
//        let lat2:CLLocationDegrees = 40.538629
//        let lon2:CLLocationDegrees = -3.893751
//        let myLocation2:CLLocation = CLLocation (latitude: lat2, longitude: lon2)
//        
//
//        let myQuery = DataHolder.sharedInstance.geoFire?.query(at: myLocation2, withRadius: 10000)
//        var queryHandler = myQuery?.observe(.keyEntered, with: { (key:String!, location:CLLocation!) in
//            
//        } )
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

}
