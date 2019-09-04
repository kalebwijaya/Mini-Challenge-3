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
    
    @IBAction func pressChatButton(_ sender: Any) {
        usr_phone = 6287775771376
        UIApplication.shared.open(URL(string:"https://api.whatsapp.com/send?phone="+"\(String(describing: usr_phone))")!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        ownerPhoto.layer.cornerRadius=6
    }

}
