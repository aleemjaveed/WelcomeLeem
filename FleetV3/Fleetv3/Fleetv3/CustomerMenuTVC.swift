//
//  CustomerMenuTVC.swift
//  Fleetv3
//
//  Copyright © 2018 Aleem Javeed. All rights reserved.
//

import UIKit

class CustomerMenuTVC: UITableViewController {

    @IBOutlet weak var profilepicimg: UIImageView!
    @IBOutlet weak var namelabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        namelabel.text = User.currentUser.name
        
        profilepicimg.image = try! UIImage(data: Data(contentsOf: URL (string:User.currentUser.pictureURL!)!))
        profilepicimg.layer.borderWidth = 1.5
        profilepicimg.layer.borderColor = UIColor.white.cgColor
        profilepicimg.clipsToBounds = true
        profilepicimg.layer.cornerRadius = 70/2



        //the picture url can be unknow ! makes it certain
            
        view.backgroundColor = UIColor(red: 0.231, green: 0.353, blue: 0.498, alpha: 1.0)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "customerLogout"
        {
            
            Fbmanager.shared.logOut()
            User.currentUser.resetInfo()
        }
    }
}
