//
//  Fbmanager.swift
//  Fleetv3
//
//  Copyright © 2018 Aleem Javeed. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import SwiftyJSON

class Fbmanager {
    static let shared = FBSDKLoginManager()
    
    public class func getFBUserData(completionHandler: @escaping () -> Void)
    {
        if (FBSDKAccessToken.current() != nil)
        {
            FBSDKGraphRequest(graphPath: "Leem", parameters: ["fields": "name, email, picture.type(normal)"]).start(completionHandler: {(connection,result,error) in
                if ( error == nil) {
                    let json = JSON(result!)
                    print(json)
                    user.currentUser.setInfo(json:json)
                    completionHandler()
                }
            })
        }
    }
}

