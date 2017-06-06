//
//  TableDataSource.swift
//  LeanPokemons
//
//  Created by Mohammad Azam on 5/15/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class TableDataSource<CellType :UITableViewCell, Model> : NSObject, UITableViewDataSource {
    
    var cellIdentifier :String!
    var items :[Model]!
    var cellConfigure : (CellType,Model) -> ()
    
    init(cellIdentifier :String, items :[Model], cellConfigure:@escaping (CellType,Model) -> ()) {
        
        self.cellConfigure = cellConfigure
        
        super.init()
        
        self.cellIdentifier = cellIdentifier
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? CellType else {
            fatalError("Cell identifier \(cellIdentifier) not found")
        }
        
        let object = self.items[indexPath.row]
        
        cellConfigure(cell,object)
        return cell
    }
    
}
