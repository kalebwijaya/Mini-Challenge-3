//
//  LikeCollectionViewController.swift
//  Profile
//
//  Created by Delvin on 31/08/19.
//  Copyright © 2019 Delvin. All rights reserved.
//

import UIKit

struct catLiker {
    var likerName: String
    var likerLoc: String
    var likerRange: String
    var likerImage: String
}

class LikeCollectionViewController: UICollectionViewController {
    @IBOutlet weak var likeCollectionView: UICollectionView!
    var items:[catLiker] = [
    catLiker(likerName: "Lala", likerLoc: "Tangerang", likerRange: "3 km", likerImage: "2"),
    catLiker(likerName: "Fluff", likerLoc: "Jakarta", likerRange: "10 km", likerImage: "4")
    ]
    
    
    var collectionViewFlowLayout : UICollectionViewFlowLayout!
    let cellIdentifier = "LikeCell"

    var cellHeight: CGFloat!
    var itemIndexPath = 0

    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupColletionView()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
    }
    
    func setupCollectionViewItemSize(){
        if collectionViewFlowLayout == nil{
            let numberOfItemRow:CGFloat = 1
            let lineSpacing:CGFloat = 5
            let interItemSpacing:CGFloat = 10
            
            let width = (collectionView.frame.width - (numberOfItemRow - 1) * interItemSpacing) / numberOfItemRow
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: 97)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
    
    private func setupColletionView(){
        collectionView.delegate = self
        collectionView.dataSource = self

        let nib = UINib(nibName: "LikeCollectionViewCell", bundle: nil)
        likeCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath ) as! LikeCollectionViewCell
        
        cell.ownerName.text = items[indexPath.item].likerName
        cell.ownerLocation.text =  items[indexPath.item].likerLoc
        cell.ownerRange.text = items[indexPath.item].likerRange
        cell.ownerPhoto.image = UIImage(named: items[indexPath.item].likerImage)
        cell.detailsButton.tag = indexPath.row
        cell.detailsButton.addTarget(self, action: #selector(detailAction), for: .touchUpInside)
        
        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? ImageViewerViewController {
            let itemGet = sender as! catLiker
            let item = otherCat(imageName: itemGet.likerImage, catRace: "Shorthair", catName: itemGet.likerName, catGender: "Lady", distance: "\(itemGet.likerRange) Away", age: "2 yr 2 mo")
            vc.imageName = item.imageName
            vc.genderName = item.catGender
            vc.name = item.catName
            vc.race = item.catRace
            vc.distance = item.distance
            vc.age = item.age
        }
    }
    
    @objc func detailAction(sender: UIButton!) {
        performSegue(withIdentifier: "detailAction", sender: items[sender.tag])
    }

}
