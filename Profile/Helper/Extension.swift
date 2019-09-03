//
//  Extension.swift
//  MC3login
//
//  Created by Fauzi Fauzi on 23/08/19.
//  Copyright © 2019 fauzify. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

extension UIViewController {
    
    //MARK: Create Alert
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: Create Alert
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    //MARK: Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    //MARK: Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
}

extension UserDefaults{
    
    //MARK: Check Login
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        //synchronize()
    }
    
    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    //MARK: Save User Data
    func setUserID(value: String){
        set(value, forKey: UserDefaultsKeys.userID.rawValue)
        //synchronize()
    }
    
    //MARK: Retrieve User Data
    func getUserID() -> String{
        return string(forKey: UserDefaultsKeys.userID.rawValue) ?? ""
    }
   
    //MARK: How to Save
//    UserDefaults.standard.setLoggedIn(value: true)          // String
//    UserDefaults.standard.setUserID(value: result.User.id!) // String
    
    
    //MARK: How to Retrieve
//    print("ID : \(UserDefaults.standard.getUserID())")
//    UserDefaults.standard.getUserID()
}


