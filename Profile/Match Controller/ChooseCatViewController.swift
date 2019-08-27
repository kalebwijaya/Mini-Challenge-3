//
//  ChooseCatViewController.swift
//  Cantinder
//
//  Created by Kaleb Wijaya on 23/08/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//
import UIKit

struct otherCat {
    var imageName : String
    var catRace : String
    var catName : String
    var catGender : String
    var distance : String
    var age : String
}

class ChooseCatViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var items:[otherCat] = [
        otherCat(imageName: "4", catRace: "Persian", catName: "Kevin", catGender: "Gentlecat",distance: "1,3 km Away",age: "2 yr 3 mo"),
        otherCat(imageName: "2",catRace: "Scottish",catName: "Delvin", catGender: "Gentlecat",distance: "2,1 km Away",age: "2 yr 8 mo"),
        otherCat(imageName: "3",catRace: "Munchkin", catName: "Lila", catGender: "Lady",distance: "4 km Away",age: "2 yr 4 mo"),
        otherCat(imageName: "1",catRace: "Shorthair", catName: "Mimi", catGender: "Lady",distance: "5,3 km Away",age: "3 yr 1 mo")]
    
    var preferGender:[otherCat] = []
    
    var collectionViewFlowLayout : UICollectionViewFlowLayout!
    let cellIdentifier = "MatchCollectionViewCell"
    let imageViewSegueIdentifier = "viewImageSegue"
    
    var userCatGender:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catGenderPreferance()
        setupColletionView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let item = sender as! otherCat
        
        if segue.identifier == imageViewSegueIdentifier {
            if let vc = segue.destination as? ImageViewerViewController {
                vc.imageName = item.imageName
                vc.genderName = item.catGender
                vc.name = item.catName
                vc.race = item.catRace
                vc.distance = item.distance
                vc.age = item.age
            }
        }
    }
    
    private func catGenderPreferance(){
        for index in items{
            if(index.catGender != userCatGender){
                preferGender.append(index)
            }
        }
    }
    
    private func setupColletionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "MatchCollectionViewCell", bundle: nil)
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

extension ChooseCatViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return preferGender.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath ) as! MatchCollectionViewCell
        
        cell.imageView.image = UIImage(named: preferGender[indexPath.item].imageName)
        cell.catName.text = preferGender[indexPath.item].catRace
        cell.catGender.image = UIImage(named: preferGender[indexPath.item].catGender)
        cell.catDistance.text = preferGender[indexPath.item].distance
        cell.catAge.text = preferGender[indexPath.item].age
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = preferGender[indexPath.item]
        performSegue(withIdentifier: imageViewSegueIdentifier, sender: item)
    }
}
