//
//  PokemonDataSource.swift
//  LeanPokemons
//
//  Created by Mohammad Azam on 5/18/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class PokemonDataSource : NSObject, UITableViewDataSource {
    
    let cellIdentifier :String!
    
    init(cellIdentifier :String) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
}
