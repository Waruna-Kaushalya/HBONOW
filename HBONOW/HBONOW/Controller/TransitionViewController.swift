//
//  Transition.swift
//  HBONOW
//
//  Created by Waruna Kaushalya on 1/31/20.
//  Copyright © 2020 Waruna Kaushalya. All rights reserved.
//

import UIKit
import Foundation

class TransitionViewController: UIViewController, UITextFieldDelegate  {
    
    func transitionToHome()  {
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        
        view.window?.rootViewController = homeViewController
        
        view.window?.makeKeyAndVisible()
}
}
