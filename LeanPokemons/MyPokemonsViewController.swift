//
//  MyPokemonsViewController.swift
//  LeanPokemons
//
//  Created by Mohammad Azam on 5/23/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import UIKit

class MyPokemonsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let loggedIn = false
        
        if !loggedIn {
            
            guard let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") else {
                fatalError("LoginViewController not found")
            }
            
            self.present(loginVC, animated: true, completion: nil)
        }
        
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
