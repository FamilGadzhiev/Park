//
//  MenuTVC.swift
//  avionicus
//
//  Created by Фамил Гаджиев on 14.01.17.
//  Copyright © 2017 Фамил Гаджиев. All rights reserved.
//

import UIKit

class  MenuViewController: UITableViewController{
    
    
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var age: UILabel!
    
    @IBOutlet weak var wt: UILabel!
    
    @IBOutlet weak var size: UILabel!
    
    @IBOutlet weak var sex: UILabel!
    
    
    
    var menuNameArray: Array = [String]()
    var  menuImageArray: Array  = [UIImage]()
    var user: UserData? // переменная юзера для контроллера
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        // вытаскиваешь из NSUSerDefaults тот json 
        // снова user_mapp = UserData(...)
        // self.user = user_mapp
        // self.name.text = self.user.name
        
        menuNameArray = ["Profile","Tracks","Main","Friends","Message","Setting"]
        menuImageArray = [#imageLiteral(resourceName: "Profile"),#imageLiteral(resourceName: "Tracks"),#imageLiteral(resourceName: "MultiSport"),#imageLiteral(resourceName: "Group"),#imageLiteral(resourceName: "Message"),#imageLiteral(resourceName: "Settings")]
        
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.borderWidth = 0.5
        avatar.layer.cornerRadius = 75
        avatar.layer.masksToBounds = true
        avatar.clipsToBounds = true
        
        
        
        
        //self.tableView.backgroundColor = UIColor(colorLiteralRed: 63, green: 64, blue: 74, alpha: 100)
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        cell.ImIcon.image = menuImageArray[indexPath.row]
        cell.lbMenu.text! = menuNameArray [indexPath.row]
        //cell.backgroundColor = UIColor(colorLiteralRed: 63, green: 64, blue: 74, alpha: 80)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let cell: MenuTableViewCell = tableView.cellForRow(at:indexPath) as! MenuTableViewCell
        
        if cell.lbMenu.text! == "Profile" {
            
            let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
            let desController = mainStoryboard.instantiateViewController(withIdentifier: "UserVC") as! UserViewController
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            
            
  
        }
        if cell.lbMenu.text! == "Tracks"{
            
            let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
            let desController = mainStoryboard.instantiateViewController(withIdentifier: "TracksVC") as! TracksVewController
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            
            
        }
        if cell.lbMenu.text! == "Main"{
        
            let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
            let desController = mainStoryboard.instantiateViewController(withIdentifier: "TabBarC") as! TabBarController
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            
            
            
            
        }
        
        
        
        
        
    }
    
}




















