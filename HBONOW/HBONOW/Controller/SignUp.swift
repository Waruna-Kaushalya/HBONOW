//
//  SignUpViewController
//  HBONOW
//
//  Created by Waruna Kaushalya on 1/13/20.
//  Copyright © 2020 Waruna Kaushalya. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
//signUp
class SignUpViewController: UIViewController {
    
    @IBOutlet weak var fNameTxt: UITextField!
    @IBOutlet weak var LNametxt: UITextField!
    @IBOutlet weak var emailAddTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var cPasswordTxt: UITextField!
    @IBOutlet weak var zipTxt: UITextField!
    @IBOutlet weak var hboTxt: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
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
        setUpElements()
        
        
    }
    func setUpElements() {
        errorLabel.alpha = 0
    }
    
    //check the fields and validate that the data is correct. If evrything is correct, this method return nil. othervise it returns the error messase.
    func validateFields() -> String? {
        
        //check that all fields are field in
        if fNameTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || LNametxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailAddTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || cPasswordTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || zipTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  {
            
            
            
            return "Please fill ll the fields"
        }
        if passwordTxt.text != cPasswordTxt.text {
            return "Psword not mached"
        }
        
        
        
        //heck if the password is secure
        
        let cleanePassword = passwordTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if PasswordUtilities.isPasswordValid(cleanePassword) == false {
            //password secure enough
            return "Please make sure your password is at least 8 char, special chr and number"
        }
        
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        let error = validateFields()
        
        if error != nil{
            showError(error!)
            
        }else{
            //create cleand version of user
            let firstName = fNameTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let lastName = LNametxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let email = emailAddTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let password = passwordTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let cPassword = cPasswordTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let zip = zipTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            
            //Create the user
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                if err != nil {
                    //there was error creating the user
                    self.showError("Error creating user")
                    
                }else{
                    //user was created sucessfully. now store the details
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname" : firstName, "lastname" : lastName, "uid":result!.user.uid, "email": email, "zip": zip]) { (error) in
                        if error != nil {
                            self.showError("error saving user data")
                        }
                    }
                    //trnssition to the home
                    self.transitionToHome()
                    
                    
                    
                    
                }
            }
        }
        
    }
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    func transitionToHome()  {
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        
        view.window?.rootViewController = homeViewController
        
        view.window?.makeKeyAndVisible() 
    }
}

