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
    
    @IBOutlet weak var catImage: UIImageView!
    var imageName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
        // Do any additional setup after loading the view.
    }
    
    private func setupImageView(){
        guard let name = imageName else {return}
        
        if let image = UIImage(named: name){
            catImage.image = image
        }
    }
    
}
