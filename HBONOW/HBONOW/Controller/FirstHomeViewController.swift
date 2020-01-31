//
//  FirstHomeViewController.swift
//  HBONOW
//
//  Created by Waruna Kaushalya on 1/27/20.
//  Copyright © 2020 Waruna Kaushalya. All rights reserved.
//

import UIKit
//First home
class FirstHomeViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
//    func setUpElements() {
//        
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func setUpElements() {
        
        ButtonUtilities.styleButton(signUpButton)
        ButtonUtilities.ButtonRadius_MinX_MinY_MaxX_MinY(signUpButton)
        
        ButtonUtilities.styleButton(loginButton)
        ButtonUtilities.ButtonRadius_MaxX_MinY_MaxX_MaxY(loginButton)

    }

}
