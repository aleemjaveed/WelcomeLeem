//
//  LoginVC.swift
//  Fleetv3
//
//  Copyright © 2018 Aleem Javeed. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginVC: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnLogout: UIButton!
    
    var login = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if (FBSDKAccessToken.current() != nil)
        {
            btnLogout.isHidden = false
            Fbmanager.getFBUserData(completionHandler:
            {
                self.btnLogin.setTitle("Continue as \(User.currentUser.email!)", for: .normal )
                //self.btnLogin.sizeToFit()
            })
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (FBSDKAccessToken.current() != nil && login == true){
            performSegue(withIdentifier: "CustomerView", sender: self)
        }
    }
    
    @IBAction func fbLogout(_ sender: Any)
    {
        Fbmanager.shared.logOut()
        User.currentUser.resetInfo()
        
        btnLogout.isHidden = true
        btnLogin.setTitle("Please sign in", for: .normal)
    }
    

    @IBAction func FBLoginBtn(_ sender: Any)
    {
        if (FBSDKAccessToken.current() != nil)
        {
            login = true
            self.viewDidAppear(true)
        }
        else
        {
            Fbmanager.shared.logIn(withReadPermissions: ["public_profile","email"],from: self, handler:
                {
                (result,error)in
                if (error == nil)
                {
                    Fbmanager.getFBUserData(completionHandler:
                    {
                        self.login = true
                        self.viewDidAppear(true)
                    })
                }
            })
        }
    }
    
    
  

        // Do any additional setup after loading the view.
    

 

}
