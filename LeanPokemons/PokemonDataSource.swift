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
    
    var cellIdentifier :String!
    var configureCell:(UITableViewCell,Pokemon) -> ()
    
    var items = [Pokemon]()
    
    init(cellIdentifier :String, items :[Pokemon],configureCell : @escaping (UITableViewCell,Pokemon) -> ()) {
        
        self.configureCell = configureCell
        super.init()
        self.items = items
        self.cellIdentifier = cellIdentifier
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let pokemon = items[indexPath.row]
        self.configureCell(cell,pokemon)
        return cell
    }
    
}
