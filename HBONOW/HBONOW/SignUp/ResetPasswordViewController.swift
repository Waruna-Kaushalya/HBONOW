//
//  ResetPasswordViewController.swift
//  HBONOW
//
//  Created by Waruna Kaushalya on 2/6/20.
//  Copyright © 2020 Waruna Kaushalya. All rights reserved.
//

import UIKit
import FirebaseAuth







class ResetPasswordViewController: UIViewController {
    
    let ERROR_EMPTY_EMAIL_REST = "Please enter an email address for reset password"
    
    
    let trans  = TransitionVC()
    let alert = AlertMessage()
    
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func restPassword(_ sender: Any) {
        
        guard let email = emailTextField.text, email != "" else{
            alert.alertMessage(_AlertMessage: ERROR_EMPTY_EMAIL_REST, _viewCFrom: self)
            return
        }
        resetPassword(email: email)
        
        trans.transHome(_viewCIdentifire: "LoginVC", _viewCFrom: self)
        
    }
    func resetPassword(email:String){
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error == nil {
                self.alert.alertMessage(_AlertMessage: "Psswrd rest email sent", _viewCFrom: self)
            }else{
                self.alert.alertMessage(_AlertMessage: "Somthing Error", _viewCFrom: self)
            }
        }
        
    }
    
}
