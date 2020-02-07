//
//  LoginViewController.swift
//  HBONOW
//
//  Created by Waruna Kaushalya on 1/7/20.
//  Copyright © 2020 Waruna Kaushalya. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseAuth
import FirebaseFirestore
import LocalAuthentication

//login
class LoginViewController:  UIViewController {
    
    let alertMessage = AlertMessage()
    let checkPW = CheckPasswordAndEmail()
    let trans = TransitionVC()
    let athentication = TouchIDFaceIDAuthentication()
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
    
    /// An authentication context stored at class scope so it's available for use during UI updates.
    var context = LAContext()
    
    /// The available states of being logged in or not.
    enum AuthenticationState {
        case loggedin, loggedout
    }
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
        context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
    }
//    @IBOutlet weak var errorLabel: UILabel!
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        
        
        
        //        context = LAContext()
        //        context.localizedCancelTitle = "Enter Username/Password"
        
        print("aaaaaaaaaaaaaaaaaaaaaa")
        
        
        
        //         First check if we have the needed hardware support.
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespaces)
        let pasword = passwordTextField.text!.trimmingCharacters(in: .whitespaces)
        
        if passwordTextField.text != "" || emailTextField.text != ""{
            print("bbbbbbbbbbbbbbbbbbbbb")
            print("-----------1111111------------")
            print(email)
            print(pasword)
             print("-----------1111111------------")
            self.checkPW.checkPasswordAndEmail(_password: pasword, _email: email, _viewFrom: self)
            
            print("-----------2222222------------")
            print(email)
            print(pasword)
            print("-----------22222222------------")
//            email = ""
//            pasword = ""
        }else{
            athentication.authenticateUser(_viewIdentifire: "HomeVC", _viewFrom: self)

        }
 
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
        
    }
    
    func setUpElements() {
//        errorLabel.alpha = 0
        
        TextFieldUtilities.TextFieldRadius_MaxX_MinY_MaxX_MaxY(passwordTextField)
        TextFieldUtilities.TextFieldRadius_MinX_MinY_MaxX_MinY(emailTextField)
        
        ButtonUtilities.ButtonRadius_All(signInButton)
        
    }
    
   
}

