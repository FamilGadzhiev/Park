//
//  SideMenuTableViewController.swift
//  Avionicus
//
//  Created by Фамил Гаджиев on 09.03.17.
//  Copyright © 2017 Фамил Гаджиев. All rights reserved.
//

import UIKit
import SDWebImage
import SideMenu

class SideMenuTableViewController: UITableViewController {

    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var size: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var avatarIm: UIImageView!
    
    var menuNameArray: Array = [String]()
    var menuImageArray: Array = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        

        avatarIm.layer.borderColor = UIColor.white.cgColor
        avatarIm.layer.borderWidth = 0.5
        avatarIm.layer.cornerRadius = 75
        avatarIm.layer.masksToBounds = true
        avatarIm.clipsToBounds = true
        
        menuNameArray = ["Profile","Tracks","Main","Friends"]
        menuImageArray = [#imageLiteral(resourceName: "Profile"),#imageLiteral(resourceName: "Group"),#imageLiteral(resourceName: "Message"),#imageLiteral(resourceName: "Settings")]
        
        
        
        
    }

    // MARK: - Table view data source

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // this will be non-nil if a blur effect is applied
        guard tableView.backgroundView == nil else {
            return
        }
        
        // Set up a cool background image for demo purposes
        let imageView = UIImageView(image:#imageLiteral(resourceName: "Little bit Black"))
        imageView.contentMode = .scaleAspectFill
        //imageView.backgroundColor = UIColor.black.withAlphaComponent(5)
        tableView.backgroundView = imageView
    }

    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuNameArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTableViewCell") as! SideMenuTableViewCell
        
        return cell

    }

}
