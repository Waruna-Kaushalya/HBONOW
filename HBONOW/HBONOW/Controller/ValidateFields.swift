//
//  ValidateFields.swift
//  HBONOW
//
//  Created by Waruna Kaushalya on 2/5/20.
//  Copyright © 2020 Waruna Kaushalya. All rights reserved.
//

import Foundation
import UIKit

class ValidateFields: UIViewController {
    func valiDateFields(fieldname: UITextField ) -> String {
        var message:String = ""
        if fieldname.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  {
            message =  "Please fill ll the fields"
        }
    return message
}
}
