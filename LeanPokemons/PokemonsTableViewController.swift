//
//  PokemonsTableViewController.swift
//  LeanPokemons
//
//  Created by Mohammad Azam on 5/15/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import UIKit

class PokemonsTableViewController: UITableViewController, SegueHandler {

    var pokemons = [Pokemon]()
    private var tableSource :TableDataSource<UITableViewCell,Pokemon>!
    
    enum SegueIdentifier :String {
        case showItems = "showItems"
    }
    
    init(pokemons :[Pokemon]) {
       
        
        super.init(nibName: nil, bundle: nil)
        self.pokemons = pokemons
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        populatePokemons()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segueIdentifier(for: segue) {
            case .showItems:
                print("show items")
        }
    }
    
    private func populatePokemons() {
        
        self.tableSource = TableDataSource(cellIdentifier: "Cell", items: pokemons) { cell, pokemon in
            
            cell.textLabel?.text = pokemon.name
        }
        
        self.tableView.dataSource = self.tableSource
        self.tableView.reloadData()

        
        
        
//        Webservice().load(Pokemon.all) { [unowned self] pokemons in
//            
//            if var pokemons = pokemons {
//                
//                // making it empty!
//                //pokemons.removeAll()
//                
//                if pokemons.isEmpty {
//                    
//                    // display an empty view instead of the table view
//                    let emptyView = EmptyView(frame: self.tableView.frame)
//                    self.view = emptyView
//                    return 
//                    
//                }
//                
//                self.tableSource = TableDataSource(cellIdentifier: "Cell", items: pokemons) { cell, pokemon in
//                    
//                    cell.textLabel?.text = pokemon.name
//                }
//                
//                self.tableView.dataSource = self.tableSource
//                self.tableView.reloadData()
//            }
        
    }

}
