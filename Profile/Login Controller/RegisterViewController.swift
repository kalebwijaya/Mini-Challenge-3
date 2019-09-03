//
//  RegisterViewController.swift
//  MC3login
//
//  Created by Fauzi Fauzi on 23/08/19.
//  Copyright © 2019 fauzify. All rights reserved.
//

import UIKit
import CloudKit
import MapKit
import CoreLocation

class RegisterViewController: UIViewController, UITextFieldDelegate, MKMapViewDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    let buttonSegueIdentifier = "toLogin"
    let publicDB = CKConnection.publicCK
    var locationManager = CLLocationManager()
    var location: CLLocation!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        determineMyCurrentLocation()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        self.emailTF.delegate = self
        self.phoneTF.delegate = self
        self.passwordTF.delegate = self
        checkBoxButton.isSelected = false
        registerButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
    
    func determineMyCurrentLocation() {
        if CLLocationManager.locationServicesEnabled()
        {
            self.locationManager = CLLocationManager()
            self.locationManager.delegate = self
            self.locationManager.distanceFilter = kCLDistanceFilterNone
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            
            let authorizationStatus = CLLocationManager.authorizationStatus()
            if (authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways)
            {
                self.locationManager.startUpdatingLocation()
            }
            else if (locationManager.responds(to: #selector(CLLocationManager.requestAlwaysAuthorization)))
            {
                self.locationManager.requestAlwaysAuthorization()
            }
            else
            {
                self.locationManager.startUpdatingLocation()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error while requesting new coordinates")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        self.location = locations[0]
        print("lat : \(locations[0].coordinate.latitude)")
//        self.latitude = locations[0].coordinate.latitude
//        self.longitude = locations[0].coordinate.longitude
    }
//    //  get location CKRECORD
//        func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//            location = locations.last!
//                    let id = CKRecord.ID(recordName: "01")
//                    let locationRecord = CKRecord(recordType: "location", recordID: id)
//                    locationRecord.setObject(location, forKey: "location")
//                    // or locationRecord["location"] = location
//                    publicDB.save(locationRecord) { record, error in
//                        //
//                    }
//        }
    
    
    // Hide Keyboard When Return Tapped. You must add UITextFieldDelegate and delegete the Text Field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func RegisterAction(_ sender: Any) {
        let phoneTFLength = phoneTF.text!.count
        let passTFLength = passwordTF.text!.count

        if emailTF.text!.isEmpty || phoneTF.text!.isEmpty || passwordTF.text!.isEmpty {
            showAlert(title: "Alert", message: "All text field must be filled")
            
        } else if phoneTFLength < 8 {
            showAlert(title: "Alert", message: "Fill valid phone number")
        } else if passTFLength < 4 {
            showAlert(title: "Alert", message: "Fill valid password number")
        } else {
            //success
            registerUser()
//
//            performSegue(withIdentifier: buttonSegueIdentifier, sender: registerButton)
        }
    }
    
    @IBAction func checkBoxTos(_ sender: UIButton) {
        if (sender.isSelected == true)
        {            sender.setImage(UIImage(named: "ic_unchecked"), for: UIControl.State.normal)
            sender.isSelected = false
            registerButton.isEnabled = false
            registerButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
        else
        {
            sender.setImage(UIImage(named: "ic_checked"), for: UIControl.State.normal)
            sender.isSelected = true
            //action kalau checked
            registerButton.isEnabled = true
            registerButton.backgroundColor = #colorLiteral(red: 0.9383456111, green: 0.5349285603, blue: 0.4344137311, alpha: 1)
        }
    }
    
    func registerUser() {
        // MARK: - CloudKit - saveRecord
        //        let userRecordID = CKRecord.ID(recordName: idTextField.text ?? "123")
        let userRecord = CKRecord(recordType: RecordTypeNames.USER)
        userRecord[UserDataFields.email] = emailTF.text! as NSString
        userRecord[UserDataFields.phoneNumber] = phoneTF.text! as NSString
        userRecord[UserDataFields.password] = passwordTF.text! as NSString
        userRecord[UserDataFields.username] = emailTF.text! as NSString
        userRecord[UserDataFields.photo] = "" as NSString
        userRecord[UserDataFields.address] = location

        publicDB.save(userRecord) {
            (record, error) in
            if let error = error {
                print("LogErrorDB \(error)")
                self.showAlert(title: "Register Failed", message: "Failed : \(error)")
                return
            }
            print("Data saved")
            self.showAlert(title: "Registered", message: "Your email has registered, you can login with your email now")
//            self.performSegue(withIdentifier: self.buttonSegueIdentifier, sender: self.registerButton)
//
        }
    }
    
    
//    func addUsersRecordType(email: String, username:String, password: String, phoneNumber: String, photo: String){
//
//        let predicate = NSPredicate(format: "\(UserDataFields.email) == %@", emailTF.text!)
//        let query = CKQuery(recordType: RecordTypeNames.USER, predicate: predicate)
//
//        publicDB.perform(query, inZoneWith: nil) { (records, error) in
//            if error != nil {
//                print(error!.localizedDescription)
//            }else{
//                guard let records = records else {return}
//                if records.count > 0 {
//                    print("This email was already used")
//                }else{
//                    let record = CKRecord(recordType: RecordTypeNames.USER)
//                    record[UserDataFields.email] = email as NSString
//                    record[UserDataFields.username] = username as NSString
//                    record[UserDataFields.phoneNumber] = phoneNumber as NSString
//                    record[UserDataFields.password] = password as NSString
//                    record[UserDataFields.photo] = photo as NSString
//                }
//            }
//
//        }
//
//    }
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            self.alert(message: message , title: title)
        }
    }
    
}
