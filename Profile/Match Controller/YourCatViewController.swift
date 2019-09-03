//
//  ViewController.swift
//  Cantinder
//
//  Created by Kaleb Wijaya on 21/08/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

struct yourCat {
    var imageName : String
    var catRace : String
    var catName : String
    var catGender : String
    var age : String
}

class YourCatViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var items=[Cat]()
    var collectionViewFlowLayout : UICollectionViewFlowLayout!
    let cellIdentifier = "MatchCollectionViewCell"
    let imageViewSegueIdentifier = "chooseCat"
    let buttonSegueIdentifier = "toAddCat"
    
    var cellHeight:CGFloat!

//    var items:[Cat] = [
//        Cat(imageName: "1", catRace: "Persian", catName: "Garou", catGender: "Gentlecat", age: "2 yr 3 mo", vaccines: ["A","B"]),
//        Cat(imageName: "2",catRace: "Scottish",catName: "Nina", catGender: "Lady", age: "2 yr 11 mo", vaccines: ["A","B"]),
//        Cat(imageName: "3",catRace: "Shorthair", catName: "Vinzz", catGender: "Gentlecat", age: "3 yr 1 mo", vaccines: ["A","B"]),
//        Cat(imageName: "4",catRace: "Shorthair", catName: "Leya", catGender: "Lady", age: "3 yr 3 mo", vaccines: ["A","B"])]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColletionView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize() 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == imageViewSegueIdentifier {
            let item = sender as! yourCat
            if let vc = segue.destination as? ChooseCatViewController {
                let navView = UIView()
                
                let label = UILabel()
                label.text = item.catName
                label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
                label.sizeToFit()
                label.center = navView.center
                label.textAlignment = NSTextAlignment.center
                
                let image = UIImageView()
                image.image = UIImage(named: item.catGender)
                let imageAspect = image.image!.size.width/image.image!.size.height
                
                image.frame = CGRect(x:label.layer.bounds.maxX - 20, y: label.frame.origin.y, width: label.frame.size.height*imageAspect, height: label.frame.size.height)
                image.contentMode = UIView.ContentMode.scaleAspectFit
                
                navView.addSubview(image)
                navView.addSubview(label)
                navView.sizeToFit()
                
                vc.navigationItem.titleView = navView
                
                vc.userCatGender = item.catGender
            }
        }
    }
    
    private func setupColletionView(){
        
        if (items.count == 0){
            createAddCatButton()
        }
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "MatchCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    func createAddCatButton(){
        let addButton = UIButton(frame: CGRect(x: (screenWidth/2)-75, y: screenHeight/2-75, width: 150, height: 150))
        addButton.borderColor = #colorLiteral(red: 0.9383456111, green: 0.5349285603, blue: 0.4344137311, alpha: 1)
        addButton.borderWidth = 6
        addButton.layer.cornerRadius = addButton.bounds.size.width/2
        addButton.setTitle("Add Cat", for: .normal)
        addButton.setTitleColor(#colorLiteral(red: 0.9383456111, green: 0.5349285603, blue: 0.4344137311, alpha: 1), for: .normal)
        addButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    
        self.view.addSubview(addButton)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: self.buttonSegueIdentifier, sender: self)
        }
    }
    
    private func setupCollectionViewItemSize(){
        if collectionViewFlowLayout == nil{
            let numberOfItemRow:CGFloat = 2
            let lineSpacing:CGFloat = 20
            let interItemSpacing:CGFloat = 20
            
            let width = (collectionView.frame.width - (numberOfItemRow - 1) * interItemSpacing) / numberOfItemRow
            cellHeight = width
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: cellHeight)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
}

extension YourCatViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (items.count == 0){
            
        }
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath ) as! MatchCollectionViewCell

        cell.imageView.image = UIImage(named: items[indexPath.item].imageName)
        cell.catName.text = items[indexPath.item].catName
        cell.catGender.image = UIImage(named: items[indexPath.item].catGender)
        cell.catAge.text = items[indexPath.item].age
        cell.catDistance.text = ""
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        performSegue(withIdentifier: imageViewSegueIdentifier, sender: item)
    }
    
}
 
