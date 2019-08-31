//
//  LikeCollectionViewCell.swift
//  Profile
//
//  Created by Delvin on 31/08/19.
//  Copyright © 2019 Delvin. All rights reserved.
//

import UIKit

class LikeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ownerPhoto: UIImageView!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var ownerLocation: UILabel!
    @IBOutlet weak var ownerRange: UILabel!
    
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    
    var usr_phone: Int?
    var pic = #imageLiteral(resourceName: "like")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.likeOwnerView.register(UINib.init(nibName: “likeCell”, bundle: nil), forCellWithReuseIdentifier: “likeCell”)
        ownerPhoto.image = pic
        
//        UIApplication.shared.open(URL(string:"https://api.whatsapp.com/send?phone=82165658747")!)
        UIApplication.shared.open(URL(string:"https://api.whatsapp.com/send?phone="+"\(String(describing: usr_phone))")!)
    }

}
