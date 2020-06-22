//
//  UiViewExtension.swift
//  IOS-Swift-Flip-Card-Effect
//
//  Created by c.pabon.cuellar on 30/04/2020.
//  Copyright © 2020 cristhia.pabon. All rights reserved.
//

import UIKit

extension UIView {
    
    func flipFromLeft(withDuration duration: TimeInterval){
        UIView.animate(withDuration: duration) {
            self.alpha = 0
        }
        UIView.transition(with: self, duration: duration, options: [.transitionFlipFromLeft,.showHideTransitionViews], animations:{
            self.alpha = 1
        }, completion: nil)
    }
    
    func flipFromRight(withDuration duration: TimeInterval){
        UIView.animate(withDuration: duration) {
            self.alpha = 0
        }
        UIView.transition(with: self, duration: duration, options:  [.transitionFlipFromRight,.showHideTransitionViews], animations: {
            self.alpha = 1
        }, completion: nil)
    }
}
