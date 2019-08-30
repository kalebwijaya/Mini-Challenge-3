//
//  EditViewController.swift
//  Profile
//
//  Created by Delvin on 22/08/19.
//  Copyright © 2019 Delvin. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var ownerPic: UIImageView!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var locationButton: UIButton!
    
    var name: String!
    var photo: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        ownerPic.image = UIImage(named: photo)
        ownerPic.layer.cornerRadius = ownerPic.frame.height/2
        
        let actionButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editAccount))
        self.navigationItem.rightBarButtonItem = actionButton
        
        let backButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = backButton
        
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    @objc func editAccount() {
        
    }
    
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
