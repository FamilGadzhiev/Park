//
//  TabBarC.swift
//  avionicus
//
//  Created by Фамил Гаджиев on 25.01.17.
//  Copyright © 2017 Фамил Гаджиев. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = UIColor(colorLiteralRed: 240.0 , green: 251.0 , blue: 255.0 , alpha: 100.0)
        self.tabBar.unselectedItemTintColor =  UIColor(colorLiteralRed: 230.0 , green: 240.0 , blue: 245.0 , alpha: 50.0)
        self.tabBar.backgroundImage = UIImage(named:"Rectangle 38.png")
        
        
        // Do any additional setup after loading the view.
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.title!)
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return [.portrait, .landscapeRight]
    }

    

}
