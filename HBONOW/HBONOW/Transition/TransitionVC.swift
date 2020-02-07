//
//  TransHome.swift
//  HBONOW
//
//  Created by Waruna Kaushalya on 2/5/20.
//  Copyright © 2020 Waruna Kaushalya. All rights reserved.
//
import UIKit
import Foundation

 public class TransitionVC {
    
    public func transHome(_viewCIdentifire : String, _viewCFrom:UIViewController) {
        
        let viewName = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: _viewCIdentifire)
        
        _viewCFrom.present(viewName, animated: true, completion: nil)
        
    }
}
