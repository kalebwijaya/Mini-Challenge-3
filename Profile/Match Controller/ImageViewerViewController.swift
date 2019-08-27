//
//  ImageViewerViewController.swift
//  Cantinder
//
//  Created by Kaleb Wijaya on 21/08/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

class ImageViewerViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var catName: UILabel!
    @IBOutlet weak var catRace: UILabel!
    @IBOutlet weak var catAge: UILabel!
    @IBOutlet weak var catDisctance: UILabel!
    @IBOutlet weak var catGender: UIImageView!
    
    var imageName:String!
    var genderName:String!
    var name:String!
    var age:String!
    var race:String!
    var distance:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView(){
        guard let name = imageName else {return}
        if let image = UIImage(named: name){
            profileImage.image = image
        }
        guard let gender = genderName else {return}
        if let image = UIImage(named: gender){
            catGender.image = image
        }
        catName.text = self.name
        catName.sizeToFit()
        
        catRace.text = race
        catRace.sizeToFit()
        
        catDisctance.text = distance
        catDisctance.sizeToFit()
        
        catAge.text = age
        catAge.sizeToFit()
    }
    

}
