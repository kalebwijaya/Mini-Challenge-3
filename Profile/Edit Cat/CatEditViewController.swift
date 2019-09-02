//
//  CatEditViewController.swift
//  MC3login
//  Created by Fauzi Fauzi on 26/08/19.
//  Copyright © 2019 fauzify. All rights reserved.

import UIKit

struct ImageCat {
    var imageName : String
    var isSet : Bool
}

class CatEditViewController: UIViewController{
    @IBOutlet weak var photoGalleryCollectionView: UICollectionView!
    
    var items:[ImageCat] = [
        ImageCat(imageName: "cat01", isSet: true),
        ImageCat(imageName: "1", isSet: false),
        ImageCat(imageName: "2", isSet: false),
        ImageCat(imageName: "4", isSet: false),
        ImageCat(imageName: "cat01", isSet: false),
        ImageCat(imageName: "", isSet: false)]
    
    var collectionViewFlowLayout : UICollectionViewFlowLayout!
    let cellIdentifier = "ItemViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColletionView()
        
        let actionButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editCat))
        self.navigationItem.rightBarButtonItem = actionButton
        
        let backButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    @objc func editCat() {
        
    }
    
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupColletionView(){
        photoGalleryCollectionView.delegate = self
        photoGalleryCollectionView.dataSource = self
        
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: nil)
        photoGalleryCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
        
        let nib = UINib(nibName: "PhotoGalleryViewCell", bundle: nil)
        photoGalleryCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollectionViewItemSize(){
        if collectionViewFlowLayout == nil{
            let numberOfItemRow:CGFloat = 3
            let lineSpacing:CGFloat = 20
            let interItemSpacing:CGFloat = 20
            
            let width = (photoGalleryCollectionView.frame.width - (numberOfItemRow - 1) * interItemSpacing) / numberOfItemRow
            let height = width
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            photoGalleryCollectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
}

extension CatEditViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath ) as! PhotoGalleryViewCell
        
        cell.EditPhotoImageView.image = UIImage(named: items[indexPath.item].imageName)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let item = items[indexPath.item]
//        performSegue(withIdentifier: identifier, sender: item)
    }
}
