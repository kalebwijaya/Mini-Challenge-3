//
//  ItemCollectionViewCell.swift
//  Profile
//
//  Created by Delvin on 22/08/19.
//  Copyright © 2019 Delvin. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var catGender: UIImageView!
    @IBOutlet weak var catName: UILabel!
    @IBOutlet weak var catAge: UILabel!
    @IBOutlet weak var bgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
                
        catName.layer.zPosition = 1
        catAge.layer.zPosition = 1
        catGender.layer.zPosition = 1
        
        imageView.layer.cornerRadius = 6
        
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        
        // Initialization code
    }

}
