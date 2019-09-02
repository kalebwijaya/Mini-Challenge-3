//
//  LoginViewController.swift
//  MC3login
//
//  Created by Fauzi Fauzi on 23/08/19.
//  Copyright © 2019 fauzify. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    let buttonSegueIdentifier = "toProfil"

    override func viewDidLoad() {
        super.viewDidLoad()
        delegateView()
        // Do any additional setup after loading the view.
    }
    
    private func delegateView() {
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
            showAlert(title: "Alert", message: "Fill valid password number")
        } else {
//            success
            performSegue(withIdentifier: buttonSegueIdentifier, sender: sender)
        }
    }
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            self.alert(message: message , title: title)
        }
    }
}
