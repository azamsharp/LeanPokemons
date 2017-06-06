//
//  PokemonTableViewControllerUgly.swift
//  LeanPokemons
//
//  Created by Mohammad Azam on 5/23/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import UIKit

class PokemonTableViewControllerUgly: UITableViewController, SegueHandler {

    private var dataSource :TableDataSource<UITableViewCell,Pokemon>!
    
    private var pokemons = [[String:Any]]()
    
    enum SegueIdentifier : String {
        case showPokemonDetails = "showPokemonDetails"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // populate pokemons 
        
        updateTableView()
        
    }
    
    private func updateTableView() {
        
        Webservice().load(Pokemon.all) { [unowned self] pokemons in
            
            if let pokemons = pokemons {
                
                self.dataSource = TableDataSource(cellIdentifier: "Cell", items: pokemons) { cell, pokemon in
                    cell.textLabel?.text = pokemon.name
                    
                }
                
                self.tableView.dataSource = self.dataSource
                self.tableView.reloadData()
            }
            
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch(segueIdentifier(for: segue)) {
            case .showPokemonDetails:
                
                guard let indexPath = self.tableView.indexPathForSelectedRow else {
                    fatalError("IndexPath not defined")
                }
                
                guard let controller = segue.destination as? PokemonDetailsViewController else {
                    fatalError("PokemonDetailsViewController not found")
                }
                
                
                controller.pokemon = self.pokemons[indexPath.row]
        }
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
