//
//  BaseTabBarViewController.swift
//  LeanPokemons
//
//  Created by Mohammad Azam on 5/28/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class BaseTabBarViewController : UITabBarController {
    
}

extension BaseTabBarViewController : UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        guard let controller = viewController as? LoginHandler else {
            return true
        }
        
        let isValid = controller.validate()
        
        if !isValid {
            
            guard let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
                fatalError("LoginViewController not found")
            }
            
            self.present(loginVC, animated: true, completion: nil)
        }
        
        return isValid
    }
    
}
