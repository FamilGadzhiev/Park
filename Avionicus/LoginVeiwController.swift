//
//  LoginVC.swift
//  avionicus
//
//  Created by Фамил Гаджиев on 02.11.16.
//  Copyright © 2016 Фамил Гаджиев. All rights reserved.
//

import UIKit
import Alamofire
import IDZSwiftCommonCrypto


class LoginViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var loginEnter: RoundTextField!
    @IBOutlet weak var passwordEnter: RoundTextField!
    @IBOutlet weak var signIn: RoundButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginEnter.delegate = self
        
        //let request = Avionicus.registration("famil", "12332", "famil@yandex.ru").request
        //print (request)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text = (loginEnter.text! as NSString).replacingCharacters(in: range, with: string)
        
        if !text.isEmpty{
            signIn.isUserInteractionEnabled = true
        } else {
            signIn.isUserInteractionEnabled = false
        } 
        return true
    }
  
    
    @IBAction func loginAction(_ sender: AnyObject) {
        
        
        if let login = loginEnter.text, let pass = passwordEnter.text, (login.characters.count > 0 && pass.characters.count > 0){
            
            let loginInput = self.loginEnter.text!
            let password = self.passwordEnter.text!
            
            let md5s2: Digest = Digest(algorithm: .md5)
            md5s2.update(string: password)
            let digest = md5s2.final()
            
            apiManager.auth(login: loginInput, pass: hexString(fromArray: digest)) { result in
                
                switch result {
                case .success(let userData):
                
                    print("Hash is \(userData.hash)")
                    print(userData.sMsgTitle!)
                    
                self.performSegue(withIdentifier: AvionicusSegues.goToTab, sender: self)
                    
                case .failure(let error):
                    
                    print("ERROR! \(error.localizedDescription)")
                    let errorAlert = UIAlertController(title: "Error", message: " Что то пошло не так, попробуй снова =( ", preferredStyle: UIAlertControllerStyle.alert)
                    let actionError = UIAlertAction(title: "Try Again", style: .cancel, handler: nil)
                    errorAlert.addAction(actionError)
                    self.present(errorAlert, animated: true, completion: nil)
                    
                }
            }
        } else{
            let alert = UIAlertController(title: "Username and Password required", message: "You must enter both a username and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)

        }
    }
}
