//
//  SegueHandler.swift
//  LeanPokemons
//
//  Created by Mohammad Azam on 5/22/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

protocol SegueHandler {
    
    associatedtype SegueIdentifier :RawRepresentable
}

extension SegueHandler where Self :UIViewController, SegueIdentifier.RawValue == String  {
    
    func segueIdentifier(for segue:UIStoryboardSegue) -> SegueIdentifier {
        
        guard let identifier = segue.identifier,
              let segueIdentifier = SegueIdentifier(rawValue: identifier)
        else {
            fatalError("Identifier not defined")
        }
        
        return segueIdentifier
    }
    
}






