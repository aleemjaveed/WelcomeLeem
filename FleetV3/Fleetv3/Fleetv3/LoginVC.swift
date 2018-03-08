//
//  LoginVC.swift
//  Fleetv3
//
//  Copyright © 2018 Aleem Javeed. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginVC: UIViewController {

    var login = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (FBSDKAccessToken.current() != nil && login == true){
            performSegue(withIdentifier: "CustomerView", sender: self)
        }
    }
    
    @IBAction func FBLoginBtn(_ sender: Any) {
        if (FBSDKAccessToken.current() != nil){
            login = true
            self.viewDidAppear(true)
        }else{
            Fbmanager.shared.logIn(withReadPermissions: ["public_profile","email"],from: self, handler:{
                (
                result,error)in
                if (error == nil) {
                    self.login = true
                }
            })
        }
    }
    
    
  

        // Do any additional setup after loading the view.
    

 

}
