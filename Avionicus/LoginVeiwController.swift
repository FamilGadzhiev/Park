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

    @IBOutlet weak var signIn: RoundeButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginEnter.delegate = self
                        
        
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
            

            let parametr = [ "login": loginInput, "password": hexString(fromArray: digest), "response_type":"json", "avkey": AVKEY]
            
            Alamofire.request(LOGINURL, method: .get, parameters: parametr)
                .validate(contentType: ["application/json"])
                .responseObject{ (response: DataResponse<UserData>)  in // здесь надо ловить твою ошибку
                    
                    switch response.result {
                    case .success:
                        
                        // проверка что норм json
                        // json, который пришел в dictionary сохранить в NSUserDefaults
                        // let user  = UserData(...) либо ошибку
                        
                        let user = response.result.value
                        
                        print("Hash: \(user?.hash)")
                        print("id: \(user?.userId)")
                        print("login \(user?.login)")
//                        let imageString = user?.profile_avatar
//                        let image = NSURL(string: imageString!)
//                        
                        
                        let boolSucces = user?.bStateError!
                        
                        if  boolSucces == false {
                            
                            let succesAlert = UIAlertController(title: "Successful", message: "Authorization successful, welcome to Avionicus", preferredStyle: UIAlertControllerStyle.alert)
                            let successAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                            succesAlert.addAction(successAction)
                            self.present(succesAlert, animated: true, completion: nil)
                            
                            
                            //self.performSegue(withIdentifier: "RevealVC", sender: nil)
                            
                            
                        }
                        else{
                            
                            let errorAlert = UIAlertController(title: "Error", message: " \(user!.sMsg) =( ", preferredStyle: UIAlertControllerStyle.alert)
                            let actionError = UIAlertAction(title: "Try Again", style: .cancel, handler: nil)
                            errorAlert.addAction(actionError)
                            self.present(errorAlert, animated: true, completion: nil)
                            
                            
                        }

                    case .failure(let error):
                        print(error)
                        
                        
                    }
            }
            
            
        }else{
            
            let alert = UIAlertController(title: "Username and Password required", message: "You must enter both a username and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    

    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
        
    }

}
