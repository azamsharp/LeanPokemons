//
//  LoginHandler.swift
//  LeanPokemons
//
//  Created by Mohammad Azam on 5/28/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

protocol LoginHandler {
    func validate() -> Bool
}

extension LoginHandler where Self : UIViewController {
    
    func validate() -> Bool {
        
        // validate the user 
        return false
    }
    
}
