//
//  RegistrationVCViewController.swift
//  Avionicus
//
//  Created by Фамил Гаджиев on 12.02.17.
//  Copyright © 2017 Фамил Гаджиев. All rights reserved.
//

import UIKit
import Alamofire

class RegistrationViewController: UIViewController {

    @IBOutlet weak var registrationBtn: RoundeButton!
    

    @IBOutlet weak var nameText: RoundTextField!
    
    @IBOutlet weak var senameText: RoundTextField!
    
    @IBOutlet weak var loginText: RoundTextField!
    
    @IBOutlet weak var mailText: RoundTextField!
    
    @IBOutlet weak var passwordText: RoundTextField!
    
    
    @IBAction func Registration(_ sender: Any) {
    
        
        
    }

    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
}
