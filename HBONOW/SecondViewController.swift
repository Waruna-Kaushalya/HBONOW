//
//  SecondViewController.swift
//  HBONOW
//
//  Created by Waruna Kaushalya on 1/13/20.
//  Copyright © 2020 Waruna Kaushalya. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var fNameTxt: UITextField!
    @IBOutlet weak var LNametxt: UITextField!
    @IBOutlet weak var emailAddTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var cPasswordTxt: UITextField!
    @IBOutlet weak var zipTxt: UITextField!
    @IBOutlet weak var hboTxt: UIButton!
    
    override func viewDidLoad() {
        
        fNameTxt.layer.cornerRadius = 9.0
        fNameTxt.clipsToBounds = true
        fNameTxt.layer.maskedCorners = [.layerMinXMinYCorner]
        
        LNametxt.layer.cornerRadius = 9.0
        LNametxt.clipsToBounds = true
         LNametxt.layer.maskedCorners = [.layerMaxXMinYCorner]
        
        emailAddTxt.layer.cornerRadius = 9.0
        emailAddTxt.clipsToBounds = true
        emailAddTxt.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        passwordTxt.layer.cornerRadius = 9.0
        passwordTxt.clipsToBounds = true
        passwordTxt.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        cPasswordTxt.layer.cornerRadius = 9.0
        cPasswordTxt.clipsToBounds = true
        cPasswordTxt.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        zipTxt.layer.cornerRadius = 9.0
        zipTxt.clipsToBounds = true
        zipTxt.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        
        hboTxt.layer.cornerRadius = 9.0
        hboTxt.clipsToBounds = true
        hboTxt.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        
        
        
        
    
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  
}
