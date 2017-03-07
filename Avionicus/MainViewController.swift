//
//  MainVC.swift
//  avionicus
//
//  Created by Фамил Гаджиев on 20.12.16.
//  Copyright © 2016 Фамил Гаджиев. All rights reserved.
//

import UIKit
import BTNavigationDropdownMenu
import SideMenu

class  MainViewController: UIViewController{

    @IBOutlet weak var MenuBarItem: UIBarButtonItem!
    
    @IBOutlet weak var StartButton: RoundeButton!
    
    var menuView: BTNavigationDropdownMenu!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dropMenuButtonView()
        setupSideMenu()
        
        
    }
    
    

    @IBAction func StartButton(_ sender: Any) {
        
        print("Start Button")
        
    }

    func setupSideMenu(){
        
        let menuLeftNavigationController = storyboard?.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? UISideMenuNavigationController
            
        menuLeftNavigationController?.leftSide = true
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        
        SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)

        
    }

    
    func dropMenuButtonView(){
        
        let itemDropMenuButton = ["Walking","Running","Bicycle","Snowboard","Skate","Motorcycle"]
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]

        
        menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: "Type", items: itemDropMenuButton as [AnyObject])
        
        menuView.cellHeight = 50
        menuView.cellBackgroundColor = self.navigationController?.navigationBar.barTintColor
        menuView.cellSelectionColor = UIColor(red: 0.0/255.0, green:160.0/255.0, blue:195.0/255.0, alpha: 1.0)
        menuView.shouldKeepSelectedCellColor = true
        menuView.cellTextLabelColor = UIColor.white
        menuView.cellTextLabelFont = UIFont(name: "AvenirNext-Regular", size: 17)
        menuView.cellTextLabelAlignment = .left // .Center // .Right // .Left
        menuView.arrowPadding = 15
        menuView.animationDuration = 0.1
        menuView.maskBackgroundColor = UIColor.white
        menuView.maskBackgroundOpacity = 0.3
        

        self.navigationItem.titleView = menuView
        
        
    }
    
    

}
