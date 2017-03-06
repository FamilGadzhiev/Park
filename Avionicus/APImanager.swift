//
//  APImanager.swift
//  Avionicus
//
//  Created by Фамил Гаджиев on 05.03.17.
//  Copyright © 2017 Фамил Гаджиев. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper

typealias JSON = [String: Any]

enum APIResult<T> {
    case success(T)
    case failure(Error)
}

enum Avionicus {
    case auth(String, String)
    case registration(String, String, String)
    
    
    var baseURL: String { return "http://avionicus.ru" }
    var avkey: String { return "1M1TE9oeWTDK6gFME9JYWXqpAGc" }
    
    private struct ParameterKeys {
        static let login = "login"
        static let pass = "password"
        static let avkey = "avkey"
        static let responseType = "response_type"
        static let hash = "hash"
        static let mail = "mail"
    }
    
    var path: String {
        switch self {
        case .auth: return "/api/common/login"
        case .registration: return "/api/common/registration/"
        }
    }
    
    
    
    var parameters: JSON {
        switch self {
        case .auth(let login, let pass):
            return [
                ParameterKeys.login: login,
                ParameterKeys.pass: pass,
                ParameterKeys.avkey: avkey,
                ParameterKeys.responseType: "json",
            ]
        case .registration(let login, let pass, let mail ):
            return[
                ParameterKeys.login: login,
                ParameterKeys.pass: pass,
                ParameterKeys.mail: mail,
                ParameterKeys.responseType: "json",
            ]
        }
    }
    
    var queryComponents: [URLQueryItem] {
        var items = [URLQueryItem]()
        
        for (key, value) in parameters {
            let item = URLQueryItem(name: key, value: "\(value)")
            items.append(item)
        }
        
        return items
    }
    
    var components: URLComponents {
        var componentsLocal = URLComponents(string: baseURL)!
        componentsLocal.path = path
        componentsLocal.queryItems = queryComponents
        return componentsLocal
    }
    
    var url: URL {
        return components.url!
    }
    
    var request: URLRequest {
        return URLRequest(url: url)
    }
    
}

class APIManager {
    
    var configuration: URLSessionConfiguration
    
    lazy var session: URLSession = {
        return URLSession(configuration: self.configuration)
    }()
    
    init(config: URLSessionConfiguration) {
        self.configuration = config
    }
    
    convenience init() {
        self.init(config: URLSessionConfiguration.default)
    }
    
    
    
    func fetch<T>(request: URLRequest, parse: @escaping (JSON) -> T?, completion: @escaping (APIResult<T>) -> Void ) {
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let response = response as? HTTPURLResponse else {
                let error = NSError(domain: "com.avionicus.famil", code: 20, userInfo: [:])
                completion(.failure(error))
                return
            }
            
            if data == nil {
                if let error = error {
                    completion(.failure(error))
                }
            }
            
            switch response.statusCode {
            case 200:
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as! JSON {
                    if let result = parse(json) {
                        completion(.success(result))
                    } else {
                        let error = NSError(domain: "", code: 30, userInfo: [:])
                        completion(.failure(error))
                    }
                }
            default:
                let error = NSError(domain: "", code: 40, userInfo: [:])
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    
    
    func auth(login: String, pass: String, completion: @escaping (APIResult<UserData>) -> Void) {
        let request = Avionicus.auth(login, pass).request
        
        fetch(request: request, parse: { (json) -> UserData? in
            return UserData(json: json["response"] as! JSON)
        }, completion: completion)
    }
    func auth1(login: String, pas: String, completion: @escaping (APIManager) -> Void){
        
        
        
    }
    
}









































