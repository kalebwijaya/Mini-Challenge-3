//
//  CKConnection.swift
//  Profile
//
//  Created by Fauzi Fauzi on 03/09/19.
//  Copyright © 2019 Fauzi. All rights reserved.
//

import UIKit
import CloudKit

struct CKConnection{
    static let privateCK = CKContainer.default().privateCloudDatabase
    static let publicCK = CKContainer.default().publicCloudDatabase
    
}

