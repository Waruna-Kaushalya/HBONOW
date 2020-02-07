//
//  Trans.swift
//  CustomAnimationTransition
//
//  Created by Waruna Kaushalya on 2/3/20.
//  Copyright © 2020 Felipe Florencio Garcia. All rights reserved.
//

import UIKit



class TransHome {
    
    func transitionViews(ViewC : String,_vc:UIViewController) {
        
//        let transitionDelegate: UIViewControllerTransitioningDelegate = TransitionDelegate()
        
//        self.transitioningDelegate = transitionDelegate
        
        let viewName = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ViewC)
//        viewName.transitioningDelegate = transitionDelegate
        
        _vc.present(viewName, animated: true, completion: nil)
        
    }
}
