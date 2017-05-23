//
//  EmptyView.swift
//  LeanPokemons
//
//  Created by Mohammad Azam on 5/22/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class EmptyView : UIView {
    
    var label :UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.blue
    }
    
    override func layoutSubviews() {
        
        label.frame = self.frame
        label.text = "No Pokemons found"
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
