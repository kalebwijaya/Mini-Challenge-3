//
//  Slide.swift
//  MC2
//
//  Created by Michael Varian Sutanto on 17/07/19.
//  Copyright © 2019 Group 16. All rights reserved.
//

import UIKit

class Slide: UIView {

    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var pushButton: UIButton!
    
    var listener: OnBoardingInputData?
    
    
    @IBAction func pushButtonAction(_ sender: UIButton) {
        listener?.didTap()
    }
}
