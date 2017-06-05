//
//  ContainerViewController.swift
//  LeanPokemons
//
//  Created by Mohammad Azam on 5/22/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class ContainerViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // populateTableView()
    }
    
//    init<T>(resource :Resource<T>, build: @escaping (T) -> UIViewController) {
//        
//        super.init(nibName: nil, bundle: nil)
//        
//        Webservice().load(resource) { [unowned self] result in
//            
//            if let result = result {
//                let content = build(result)
//                self.add(content: content)
//            }
//        }
//    }
    
    func load<T>(resource :Resource<T>, build: @escaping (T) -> UIViewController) {
        
        Webservice().load(resource) { [unowned self] result in
            
            if let result = result {
                let content = build(result)
                self.add(content: content)
            }
        }
    }

    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    private func populateTableView() {
        
        Webservice().load(resource: Pokemon.all, container: self) { [unowned self] pokemons in
            
            if let pokemons = pokemons {
                
               // add the data source
            }
            
            return EmptyViewController()
        }
    }
    
    private func instantiatePokemonTableViewController(pokemons :[Pokemon]) -> UIViewController {
        
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "PokemonsTableViewController") as? PokemonsTableViewController else {
            fatalError("PokemonsTableViewController does not exist")
        }
        
        controller.pokemons = pokemons
        return controller
        
    }
    
    
    
    public func add(content :UIViewController) {
     
        // remove any child controllers 
        for child in self.childViewControllers {
            child.willMove(toParentViewController: nil)
            child.view.removeFromSuperview()
            child.removeFromParentViewController()
        }
        
        addChildViewController(content)
        
        content.view.frame = self.view.bounds
        content.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(content.view)
        
        content.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        content.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        content.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        content.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        content.didMove(toParentViewController: self)
    }
    
}
