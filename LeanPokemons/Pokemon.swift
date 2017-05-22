//
//  Pokemon.swift
//  LeanPokemons
//
//  Created by Mohammad Azam on 5/15/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation

struct Pokemon {
    var name :String
}

extension Pokemon {
  
    init?(dictionary :JSONDictionary) {
        
        guard let name = dictionary["name"] as? String else {
            return nil
        }
        
        self.name = name
    }
}

extension Pokemon {
    
    static let all = Resource<[Pokemon]>(url :App.Pokemon.all.url) { data in
        
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        guard let dictionaries = json as? [JSONDictionary] else {
            return nil
        }
        return dictionaries.flatMap(Pokemon.init)
    }
    
    static func byId(id :Int) -> Resource<Pokemon> {
        
        return Resource<Pokemon>(url: App.Pokemon.get(id: id).url) { data in
            
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            guard let dictionary = json as? JSONDictionary else {
                return nil
            }
            return Pokemon(dictionary: dictionary)
        }
    }

    
    
}
