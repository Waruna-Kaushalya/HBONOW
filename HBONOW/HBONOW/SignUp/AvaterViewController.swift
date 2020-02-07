//
//  AvaterViewController.swift
//  HBONOW
//
//  Created by Waruna Kaushalya on 2/7/20.
//  Copyright © 2020 Waruna Kaushalya. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage

import FirebaseAuth
import Firebase
class AvaterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    var image: UIImage? = nil
    
    @IBOutlet weak var avater: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAvater()
    }
    
    func setupAvater(){
        avater.layer.cornerRadius = 40
        avater.clipsToBounds = true
        avater.isUserInteractionEnabled = true
        let tapGester = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
        avater.addGestureRecognizer(tapGester)
        
    }
    @objc func presentPicker(){
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    @IBAction func tapedButton(_ sender: Any) {
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard let imageSelected  = self.image else{
            print("Avter is nil")
            return
        }
        guard  let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {
            return
        }
        
        
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
            
            if err != nil {
                
                
            }else{
                //user was created sucessfully. now store the details
                
                
                //
                var imageURL: String?

                let storageRef = Storage.storage().reference(forURL: "gs://customlogindemo-ce644.appspot.com")
                let storageProfileRef = storageRef.child("profile").child(result!.user.uid)
                
                let metaData = StorageMetadata()
                metaData.contentType = "image/jpg"
                storageProfileRef.putData(imageData, metadata: metaData, completion: { (storageMetaData, error) in
                    if error != nil{
                        print("Errrror")
                        return
                    }
                    
                    //Read image url
                    storageProfileRef.downloadURL(completion: { (url, error) in
                        if let metaImageUrl = url?.absoluteString{
                            print(metaImageUrl)
                            
                            self.pushDataToFireBase(_email: email, _imageU: metaImageUrl, _UID: result!.user.uid)
                            
                        }
                    })
                })
            }
        }
        
    }
    func pushDataToFireBase(_email:String, _imageU:String, _UID:String ) {
        let db = Firestore.firestore()
        db.collection("users").addDocument(data: ["uid":_UID,"profileImageURL":_imageU,  "email": _email  ]) { (error) in
            if error != nil {
                
            }
            
        }
    }
    
}

extension AvaterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as?
            UIImage{
            image = imageSelected
            avater.image = imageSelected
            
        }
        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as?
            UIImage{
            image = imageOriginal
            avater.image = imageOriginal
            
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}
