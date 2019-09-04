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
    catLiker(likerName: "Kevin", likerLoc: "Tangerang", likerRange: "3 km", likerImage: "cat01"),
    catLiker(likerName: "Irfin", likerLoc: "Jakarta", likerRange: "10 km", likerImage: "1")
    ]
    
    
    var collectionViewFlowLayout : UICollectionViewFlowLayout!
    let cellIdentifier = "LikeCell"

    var cellHeight: CGFloat!

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
        return cell
    }

}
