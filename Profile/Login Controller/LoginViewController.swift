//
//  LoginViewController.swift
//  MC3login
//
//  Created by Fauzi Fauzi on 23/08/19.
//  Copyright © 2019 fauzify. All rights reserved.
//

import UIKit
import CloudKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    let buttonSegueIdentifier = "toProfil"
    let publicDB = CKConnection.publicCK
    var isNotRegistered = true
    
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.emailTF.delegate = self
        self.passwordTF.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        let passTFLength = passwordTF.text!.count
        
        if (emailTF.text!.isEmpty ||  passwordTF.text!.isEmpty) {
            showAlert(title: "Alert", message: "All text field must be filled")
        } else if passTFLength < 4 {
            showAlert(title: "Alert", message: "at least 4 characters")
        } else {
            checkEmailRegistered(email: emailTF.text!, password: passwordTF.text!)
//            success
//            checkEmailRegistered { (records) in
//                if records.count > 0 {
//                    print("record count \(records.count), false")
//                    self.isNotRegistered = false
//                } else {
//                    print("record = 0, true")
//                    self.isNotRegistered = true
//                }
//                self.login()
//            }
//            performSegue(withIdentifier: buttonSegueIdentifier, sender: sender)
        }
    }
    
//    MARK: Completion
//    func checkEmailRegistered( completionHandler: @escaping (_ records: [CKRecord]) -> Void) {
//        var listOfUsers = [CKRecord]()
//        let predicate = NSPredicate(format: "\(UserDataFields.email) == %@", emailTF.text!)
//        let query = CKQuery(recordType: RecordTypeNames.USER , predicate: predicate)
//        let queryOperation = CKQueryOperation(query: query)
//        queryOperation.resultsLimit = 10
//
//        // As we get each record, lets store them in the array
//        queryOperation.recordFetchedBlock = { record in
//            listOfUsers.append(record)
//        }
//
//        // Have another closure for when the download is complete
//        queryOperation.queryCompletionBlock = { cursor, error in
//            if error != nil {
//                print(error!.localizedDescription)
//            } else {
//                completionHandler(listOfUsers)
//            }
//        }
//    }

    func checkEmailRegistered(email: String, password: String) {
        let predicate = NSPredicate(format: "\(UserDataFields.email) == %@", email)
        let query = CKQuery(recordType: RecordTypeNames.USER , predicate: predicate)


        publicDB.perform(query, inZoneWith: nil) { (records, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                guard let records = records else {return}
                if records.count > 0 {
                    print("record count \(records.count), false")
                    self.isNotRegistered = false
                    let sortRecords = records.sorted(by: {$0.creationDate! > $1.creationDate!})
                    
                    for record in sortRecords{
                        self.users.append(User(record: record))
                    }
                    
                } else {
                    print("record = 0, true")
                    self.isNotRegistered = true
                }
                self.login(email: email, password: password)
            }
        }
    }

    func login (email: String, password: String){
        if (isNotRegistered){
            showAlert(title: "Alert", message: "Email Unregistered")
            
        } else {
            
            for user in users{
                if email == user.email! {
                    if password == user.password! {                            UserDefaults.standard.setLoggedIn(value: true)
                        UserDefaults.standard.setUserID(value: user.userID)
                        
                        DispatchQueue.main.async {
                        self.performSegue(withIdentifier: self.buttonSegueIdentifier, sender: self)
                        }
                        
                        print("break...")
                    } else {
                        showAlert(title: "Alert", message: "Wrong Password")
                    }
                    break
                }
            }
        }
    }
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            self.alert(message: message , title: title)
        }
    }
}
