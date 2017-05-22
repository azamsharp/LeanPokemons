//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

typealias JSONDictionary = [String:Any]

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

struct Resource<T> {
    let url :URL!
    let parse: (Data) -> T?
}

class WebService {
    
    func load<T>(resource :Resource<T>, completion:@escaping (T?) -> ()) {
        
        URLSession.shared.dataTask(with: resource.url) { data, _, _ in
            
            if let data = data {
               
                DispatchQueue.main.async {
                  completion(resource.parse(data))
                }
            }
            
        }.resume()
        
    }
    
}



let url = URL(string: "https://still-wave-26435.herokuapp.com/pokemon/all")!


URLSession.shared.dataTask(with: url) { data, response, error in
    
    // do something here
    
}.resume()


let pokemonResource = Resource<[Pokemon]>(url: url) { data in
    
    let json = try? JSONSerialization.jsonObject(with: data, options: [])
    
    guard let dictionaries = json as? [JSONDictionary] else {
        return nil
    }
    
    return dictionaries.flatMap(Pokemon.init)
}

WebService().load(resource: pokemonResource) { pokemons in
    
    if let pokemons = pokemons {
        print(pokemons)
    }
}



PlaygroundPage.current.needsIndefiniteExecution = true

