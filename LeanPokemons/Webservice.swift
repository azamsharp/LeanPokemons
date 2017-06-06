//
//  Webservice.swift
//  LeanPokemons
//
//  Created by Mohammad Azam on 5/15/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

typealias JSONDictionary = [String:Any]

enum HTTPMethod {
    case get
    case post(data :Data)
    case delete
}

extension HTTPMethod {
    
    var method :String {
        switch self {
            case .get: return "GET"
            case .post(_ ): return "POST"
            case .delete: return "DELETE"
        }
    }
    
}

struct Resource<T> {
    let url :URL!
    let parse: (Data) -> T?
    let httpMethod :HTTPMethod
}

extension Resource {
    
    init(url :URL, httpMethod :HTTPMethod = .get, parse:@escaping (Data) -> T?) {
        self.url = url
        self.parse = parse
        self.httpMethod = httpMethod
    }
}

protocol Url {
    var url :URL { get }
}

private let BASE_URL = URL(string:"https://still-wave-26435.herokuapp.com")!

enum App {
   
    enum Pokemon {
        case all
        case get(id :Int)
    }
    
    enum ShoppingList {
        case all
        case delete(id :Int)
    }
}

extension App.Pokemon : Url {
    
    var url :URL {
        
        switch self {
            case .all: return URL(string:"/pokemon/all", relativeTo:BASE_URL)!
            case .get(let id): return URL(string: "/pokemon/\(id)", relativeTo:BASE_URL)!
        }
    }
}

extension App.ShoppingList : Url {
    
    var url :URL {
        switch self {
            case .all: return URL(string:"/shoppinglist/all", relativeTo:BASE_URL)!
            case .delete(let id): return URL(string:"/shoppinglist/\(id)", relativeTo:BASE_URL)!
        }
    }
    
}

class Webservice {
    
    
    func load<T>(_ resource :Resource<T>, completion:@escaping (T?) -> ()) {
        
        var request = URLRequest(url: resource.url)
        
        switch resource.httpMethod {
            case .get:
            
                request.httpMethod = resource.httpMethod.method
            
            case .post(let data):
                
                request.httpMethod = resource.httpMethod.method
                request.httpBody = data
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            case .delete(let id):
                print(id)
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
            
        }.resume()
       
    }
}
