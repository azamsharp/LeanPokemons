//
//  PokemonDetailsViewController.swift
//  LeanPokemons
//
//  Created by Mohammad Azam on 5/23/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import UIKit

class PokemonDetailsViewController: UIViewController {

    var pokemon :[String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.pokemon["name"] as! String
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
