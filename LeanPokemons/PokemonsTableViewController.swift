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
        self.tableView.reloadData()
      //  populatePokemons()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segueIdentifier(for: segue) {
            case .showItems:
                print("show items")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = self.pokemons[indexPath.row].name
        
        return cell
        
        
    }
    
   
}
