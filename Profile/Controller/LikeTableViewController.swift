//
//  LikeVC.swift
//  Profile
//
//  Created by Delvin on 26/08/19.
//  Copyright © 2019 Delvin. All rights reserved.
//

import UIKit

struct ownerInfo {
//    static var instances = 0
    var ownerName: String
    var location: String
    var ownerImage: UIImage
}

class LikeVC: UITableViewController {
    
    var data = [ownerInfo]()
    
    @IBOutlet var likeTable: UITableView!
//    @IBOutlet weak var likeTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = [ownerInfo.init(ownerName: "Human", location: "Jakarta", ownerImage: #imageLiteral(resourceName: "1")),ownerInfo.init(ownerName: "Alien", location: "Tangerang", ownerImage: #imageLiteral(resourceName: "3"))]
        
        // Do any additional setup after loading the view.
        self.likeTable.register(LikedByTableViewCell.self, forCellReuseIdentifier: "CustomCell")
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! LikedByTableViewCell
        
        cell.mainnameView.text = data[indexPath.row].ownerName
        cell.mainlocationView.text = data[indexPath.row].location
        cell.mainimageView.image = data[indexPath.row].ownerImage
        cell.layoutSubviews()
        
        return cell
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
