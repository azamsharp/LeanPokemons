//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

protocol Serializable : Codable {
    func serialize() -> Data?
}

extension Serializable {
    
    func serialize() -> Data? {
        
        var encoder = JSONEncoder()
        let data = try? encoder.encode(self)
        return data
    }
    
}

struct Language : Serializable {
    
    var name :String
    var version :Int
    
}

let language = Language(name: "Swift", version: 4)

print(language.serialize())

print(data)


