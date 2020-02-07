//
//  CheckPasswordAndEmail.swift
//  HBONOW
//
//  Created by Waruna Kaushalya on 2/6/20.
//  Copyright © 2020 Waruna Kaushalya. All rights reserved.
//

import UIKit
import Firebase
let trans = TransitionVC()
let alert  = AlertMessage()


class CheckPasswordAndEmail: UIViewController {
    func checkPasswordAndEmail(_password: String ,_email: String, _viewFrom: UIViewController) {
        
        Auth.auth().signIn(withEmail: _email, password: _password)  { (result, error)  in
            if error != nil {
                alert.alertMessage(_AlertMessage: "Password And Email Dosent MAtched", _viewCFrom: _viewFrom)
            }else{
                
                trans.transHome(_viewCIdentifire: "HomeVC", _viewCFrom: _viewFrom)
                
            }
        }
    }
}
