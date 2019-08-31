////
////  ImageViewerViewController.swift
////  Profile
////
////  Created by Delvin on 22/08/19.
////  Copyright © 2019 Delvin. All rights reserved.
////
//

import UIKit

class OwnerCatDetailVC: UIViewController {
    
    @IBOutlet weak var myScrollView: UIScrollView!
    
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catName: UILabel!
    @IBOutlet weak var catRace: UILabel!
    @IBOutlet weak var catAge: UILabel!
    @IBOutlet weak var catGender: UIImageView!
    
    @IBOutlet weak var vaccineName: UILabel!
    @IBOutlet weak var vaccineDate: UILabel!
    @IBOutlet weak var aboutCat: UITextView!
    
    var imageName:String!
    var name: String!
    var age: String!
    var race: String!
    var gender: String!
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
        
        myScrollView.contentSize = contentViewSize
        // Do any additional setup after loading the view.
    }
    
    private func setupImageView(){
        
        guard let name = imageName else {return}
        if let image = UIImage(named: name){
            catImage.image = image
        }
        catName.text = self.name
        catRace.text = self.race
        catAge.text = self.age
        
        guard let gender = gender else {return}
        if let image = UIImage(named: gender){
            catGender.image = image
        }
    }
    
}
