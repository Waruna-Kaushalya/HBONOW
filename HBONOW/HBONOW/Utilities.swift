//
//  Utilities.swift
//  HBONOW
//
//  Created by Waruna Kaushalya on 1/27/20.
//  Copyright © 2020 Waruna Kaushalya. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    static func styleTextField(_ textField:UITextField){
        let bottomLine = CALayer()
        
//        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 2, width: textField.frame.width, height: 2)
//
//        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        
        
//        bottomLine.superlayer.cornerRadius = 9
//        bottomLine.superlayer.masksToBounds  = true
//        bottomLine.superlayer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMaxYCorner]
        
        
//        passwordTextField.clipsToBounds  = true
//        passwordTextField.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        
   
     textField.layer.addSublayer(bottomLine)
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.[a-z])(?=.[$@$#!%?&])[A-Za-z\\d$@$#!%?&]{8,}")
//        return passwordTest.evaluate(with: password)
        return true
        
    }
    
}
