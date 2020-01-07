//
//  ViewController.swift
//  HBONOW
//
//  Created by Waruna Kaushalya on 1/7/20.
//  Copyright © 2020 Waruna Kaushalya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    override func viewDidLoad() {
        
        textField1.layer.cornerRadius = 9.0
        textField1.clipsToBounds = true
        textField1.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        textField2.layer.cornerRadius = 9.0
        textField2.clipsToBounds  = true
        textField2.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        
        btn1.layer.cornerRadius = 5.0
        btn1.clipsToBounds = true
        
        btn2.layer.cornerRadius = 5.0
        btn2.clipsToBounds = true
        
        btn2.layer.borderWidth = 0.09
        btn2.layer.borderColor = UIColor.white.cgColor
//
        
            //[UIColor.white].CGColor;
        
        

        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

