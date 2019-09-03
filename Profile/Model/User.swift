//
//  User.swift
//  Profile
//
//  Created by Fauzi Fauzi on 03/09/19.
//  Copyright © 2019 Fauzi. All rights reserved.
//

import UIKit
import CloudKit
import CoreLocation

class User {
    var userID: String
    var email: String?
    var phoneNumber: String?
    var password: String?
    var username: String?
    var photo: String?
    var address: CLLocation?
    
    init(record: CKRecord) {
        userID = record.recordID.recordName
        email = record[UserDataFields.email]
        phoneNumber = record[UserDataFields.phoneNumber]
        password = record[UserDataFields.password]
        username = record[UserDataFields.username]
        photo = record[UserDataFields.photo]
        address = record[UserDataFields.address]
    }
        
}
