//
//  CustomerMenuTVC.swift
//  Fleetv3
//
//  Copyright © 2018 Aleem Javeed. All rights reserved.
//

import UIKit

class CustomerMenuTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        view.backgroundColor = UIColor(red: 0.231, green: 0.353, blue: 0.498, alpha: 1.0)
        
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "customerLogout"{
            
            Fbmanager.shared.logOut()
            user.currentUser.resetinfo()
        }
    }
}
