//
//  LikedByTableViewCell.swift
//  Profile
//
//  Created by Delvin on 26/08/19.
//  Copyright © 2019 Delvin. All rights reserved.
//

import UIKit


class LikedByTableViewCell: UITableViewCell {
    var name: String?
    var location: String?
    var photo: UIImage?
    
    var mainnameView: UITextView = {
        var nameView = UITextView()
        nameView.translatesAutoresizingMaskIntoConstraints = false
    return nameView
    }()
    
    var mainimageView: UIImageView = {
            var imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
        
        var mainlocationView: UITextView = {
            var locationView = UITextView()
            locationView.translatesAutoresizingMaskIntoConstraints = false
        return locationView
    }()
    

    @IBOutlet weak var ownerImage: UIImageView!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var chatNowButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(mainnameView)
        self.addSubview(mainimageView)
        self.addSubview(mainlocationView)
        
        mainimageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mainimageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainimageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        mainimageView.widthAnchor.constraint(equalToConstant: 73).isActive = true
        mainimageView.heightAnchor.constraint(equalToConstant: 73).isActive = true
        
        mainnameView.leftAnchor.constraint(equalTo: self.mainimageView.rightAnchor).isActive = true
        mainnameView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        mainnameView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        mainnameView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        mainlocationView.leftAnchor.constraint(equalTo: self.mainimageView.rightAnchor).isActive = true
        mainlocationView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        mainlocationView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        mainlocationView.topAnchor.constraint(equalTo: self.mainnameView.bottomAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let name = name{
            mainnameView.text = name
        }
        if let location = location{
            mainlocationView.text = location
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
