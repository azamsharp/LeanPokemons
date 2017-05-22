//
//  PokemonsTableViewController.swift
//  LeanPokemons
//
//  Created by Mohammad Azam on 5/15/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import UIKit

class PokemonsTableViewController: UITableViewController {

    private var pokemons = [Pokemon]()
    private var tableSource :TableDataSource<UITableViewCell,Pokemon>!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        populatePokemons()
    }
    
    private func populatePokemons() {
        
        Webservice().load(Pokemon.all) { [unowned self] pokemons in
            
            if let pokemons = pokemons {
                
                self.tableSource = TableDataSource(cellIdentifier: "Cell", items: pokemons) { cell, pokemon in
                    
                    cell.textLabel?.text = pokemon.name
                }
                
                self.tableView.dataSource = self.tableSource
                self.tableView.reloadData()
            }
            
        }
        
    }

    
}
