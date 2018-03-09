//
//  user.swift
//  Fleetv3
//
//  Created by Aleem Javeed on 09/03/2018.
//  Copyright © 2018 Aleem Javeed. All rights reserved.
//

import Foundation
import SwiftyJSON

class user
{
    var name : String?
    var email : String?
    var pictureURL : String?
    
    static let currentUser = user()
    
    func setInfo(json: JSON){
        self.name = json["name"].string
        self.email = json["email"].string
        
        let image = json["picture"].dictionary
        let imageData = image?["data"]?.dictionary
        self.pictureURL = imageData?["url"]?.string
    }
    
    func resetinfo()
    {
        self.name = nil
        self.email = nil
        self.pictureURL = nil
    }
}
