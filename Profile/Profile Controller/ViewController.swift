//
//  ViewController.swift
//  Profile
//
//  Created by Delvin on 22/08/19.
//  Copyright © 2019 Delvin. All rights reserved.
//

import UIKit

struct ownerCat {
    var imageName : String
    var catName: String
    var catRace: String
    var catGender: String
    var catAge: String
}

struct ownerData {
    var ownerName: String
    var ownerLocation: String
    var ownerVerification: String
}

class ViewController: UIViewController {

    @IBOutlet weak var ownerPic: UIImageView!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var ownerLoc: UILabel!
    @IBOutlet weak var ownerVerif: UILabel!
    @IBOutlet weak var verifImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items:[ownerCat] = [ownerCat(imageName: "1", catName: "Si Orenji", catRace: "Persian", catGender: "Lady", catAge: "2 yr 3 mo"), ownerCat(imageName: "2", catName: "Timmy", catRace: "Shorthair", catGender: "Gentlecat", catAge: "2 yr"), ownerCat(imageName: "3", catName: "Bitsy", catRace: "Munchkin", catGender: "Lady", catAge: "3 yr 9 mo")]
    var data = ownerData(ownerName: "Kaleb", ownerLocation: "Tangerang", ownerVerification: "Not Verified")
    
    var collectionViewFlowLayout : UICollectionViewFlowLayout!
    let cellIdentifier = "ItemCollectionViewCell"
    let imageViewSegueIdentifier = "viewImageSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColletionView()
        
        ownerPic.layer.cornerRadius = ownerPic.frame.height/2
        
        ownerName.text = data.ownerName
        ownerLoc.text = data.ownerLocation
        ownerVerif.text = data.ownerVerification
        verifImage.image = UIImage(named: data.ownerVerification)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == imageViewSegueIdentifier {
            let item = sender as! ownerCat
            if let vc = segue.destination as? OwnerCatDetailVC {
                vc.imageName = item.imageName
                vc.age = item.catAge
                vc.name = item.catName
                vc.race = item.catRace
                vc.gender = item.catGender
            }
        }
    }
    
    private func setupColletionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollectionViewItemSize(){
        if collectionViewFlowLayout == nil{
            let numberOfItemRow:CGFloat = 2
            let lineSpacing:CGFloat = 20
            let interItemSpacing:CGFloat = 20
            
            let width = (collectionView.frame.width - (numberOfItemRow - 1) * interItemSpacing) / numberOfItemRow
            let height = width
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath ) as! ItemCollectionViewCell
        
        cell.imageView.image = UIImage(named: items[indexPath.item].imageName)
        cell.catName.text = items[indexPath.item].catName
        cell.catGender.image = UIImage(named: items[indexPath.item].catGender)
        cell.catAge.text = items[indexPath.item].catAge
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        performSegue(withIdentifier: imageViewSegueIdentifier, sender: item)
    }
}

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    
}
