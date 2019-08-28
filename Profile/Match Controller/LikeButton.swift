//
//  FollowButton.swift
//  Instabook
//
//  Created by Kaleb Wijaya on 29/04/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

class LikeButton: UIButton {

   var isLiked = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton(){
//        layer.borderWidth = 1
//        layer.borderColor = #colorLiteral(red: 0.218891561, green: 0.5776638985, blue: 0.866191566, alpha: 1)
        addTarget(self, action: #selector(LikeButton.buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed(){
        activeteButton(bool : !isLiked)
    }
    
    func activeteButton(bool : Bool){
        isLiked = bool
        
        let image:UIImage = bool ? UIImage(named: "like")! : UIImage(named: "unlike")!
        
        setBackgroundImage(image, for: .normal)
    }
}
