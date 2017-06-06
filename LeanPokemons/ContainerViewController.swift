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
        
    }
    
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
