//
//  MapVC.swift
//  avionicus
//
//  Created by Фамил Гаджиев on 22.01.17.
//  Copyright © 2017 Фамил Гаджиев. All rights reserved.
//

import UIKit
import GoogleMaps
import SideMenu

class MapViewController: UIViewController{
    
    
    @IBOutlet weak var Map: GMSMapView!
    @IBOutlet weak var MenuButton: UIBarButtonItem!
    
    let locationManager = CLLocationManager()
    
    
    @IBAction func MenuBarItem(_ sender: Any) {
        present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 1.285, longitude: 103.848, zoom: 12)
        //let mapView = GMSMapView.map(withFrame: 0 , camera: camera)
        //self.view = mapView
        
        
    }
}














