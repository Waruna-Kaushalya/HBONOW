//
//  AvaterViewController.swift
//  HBONOW
//
//  Created by Waruna Kaushalya on 2/7/20.
//  Copyright © 2020 Waruna Kaushalya. All rights reserved.
//

import UIKit
import Firebase

class AvaterViewController: UIViewController {
    
    
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
        
        guard let imageSelected  = self.image else{
            print("Avter is nil")
            return
        }
        guard  let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {
            return
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
