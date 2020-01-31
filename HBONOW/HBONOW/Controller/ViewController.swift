//
//  ViewController.swift
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
class ViewController: UIViewController {
    
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
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func loginButton(_ sender: Any) {
        context = LAContext()
        
        context.localizedCancelTitle = "Enter Username/Password"
        
        // First check if we have the needed hardware support.
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            
            let reason = "Log in to your account"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in
                
                if success {
                    self.transitionToHome()
                    
                    
                } else {
                    print(error?.localizedDescription ?? "Failed to authenticate")
                    
                    // Fall back to a asking for username and password.
                    // ...
                }
            }
        } else {
            print(error?.localizedDescription ?? "Can't evaluate policy")
            
            // Fall back to a asking for username and password.
            // ...
        }
        //        }
        
    }
    
    func setUpElements() {
        errorLabel.alpha = 0
        
        TextFieldUtilities.TextFieldRadius_MaxX_MinY_MaxX_MaxY(passwordTextField)
        TextFieldUtilities.TextFieldRadius_MinX_MinY_MaxX_MinY(emailTextField)
        ButtonUtilities.ButtonRadius_All(signInButton)
        
    }
    func transitionToHome()  {
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        
        view.window?.rootViewController = homeViewController
        
        view.window?.makeKeyAndVisible()
    }
}

