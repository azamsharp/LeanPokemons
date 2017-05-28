//
//  EmptyViewController.swift
//  LeanPokemons
//
//  Created by Mohammad Azam on 5/22/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class EmptyViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 20))
        label.text = "No Pokemons Found"
        label.textAlignment = .center
        self.view.addSubview(label)
        
        
        label.center = self.view.center
        
        self.view.backgroundColor = UIColor.green 
    }
    
}
