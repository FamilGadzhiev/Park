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


class LoginViewController: UIViewController, UITextFieldDelegate {
    
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
            signIn.isUserInteractionEnabled = true
        } 
        return true
    }
  
    
    @IBAction func loginAction(_ sender: AnyObject) {
        
        let loginInput = self.loginEnter.text!
        let password = self.passwordEnter.text!
        
        let md5s2: Digest = Digest(algorithm: .md5)
        md5s2.update(string: password)
        let digest = md5s2.final()
        
        apiManager.auth(login: loginInput, pass: hexString(fromArray: digest)) { result in
            
            switch result {
            case .success(let userData):
                userData.writeToUserDefaults()
                print("Hash is \(userData.hash)")
                print(userData.sMsgTitle!)
                print("Is main thread? \(Thread.isMainThread)")
                
                self.performSegue(withIdentifier: AvionicusSegues.goToTab, sender: self)
                
            case .failure(let error):
                
                print("ERROR! \(error.localizedDescription)")
                DispatchQueue.main.async {
                    let errorAlert = UIAlertController(title: "Error", message: " Что то пошло не так, попробуй снова =( ", preferredStyle: UIAlertControllerStyle.alert)
                    let actionError = UIAlertAction(title: "Try Again", style: .cancel, handler: nil)
                    errorAlert.addAction(actionError)
                    self.present(errorAlert, animated: true, completion: nil)
                }
            }
        }
    }
}
