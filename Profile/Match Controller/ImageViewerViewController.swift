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
    @IBOutlet weak var scrollView: UIView!
    @IBOutlet weak var vaksinName: UILabel!
    @IBOutlet weak var vaksinDate: UILabel!
    @IBOutlet weak var aboutCat: UITextView!
    
    var imageName:String!
    var genderName:String!
    var name:String!
    var age:String!
    var race:String!
    var distance:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        lining()
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
        
        self.title = "Cat Profile"
    }
    
    private func lining(){
        let lineView = UIView(frame: CGRect(x: 20, y: catDisctance.frame.origin.y + 40, width: scrollView.frame.width, height: 1.0))
        lineView.layer.borderWidth = 1.0
        lineView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        scrollView.addSubview(lineView)
        
        let lineView2 = UIView(frame: CGRect(x: 20, y: vaksinName.frame.origin.y + 40, width: scrollView.frame.width, height: 1.0))
        lineView2.layer.borderWidth = 1.0
        lineView2.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        scrollView.addSubview(lineView2)
        
        let lineView3 = UIView(frame: CGRect(x: 20, y: aboutCat.frame.maxY + 15, width: scrollView.frame.width, height: 1.0))
        lineView3.layer.borderWidth = 1.0
        lineView3.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        scrollView.addSubview(lineView3)
    }

}
