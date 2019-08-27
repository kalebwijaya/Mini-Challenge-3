//
//  ItemCollectionViewCell.swift
//  Cantinder
//
//  Created by Kaleb Wijaya on 21/08/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

class MatchCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var catName: UILabel!
    @IBOutlet weak var catGender: UIImageView!
    @IBOutlet weak var catAge: UILabel!
    @IBOutlet weak var gradientBackground: UIView!
    @IBOutlet weak var catDistance: UILabel!
    
    var gradientLayer: CAGradientLayer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        gradientBackground.layer.cornerRadius = 5
        imageView.layer.cornerRadius = 5
    }

}
