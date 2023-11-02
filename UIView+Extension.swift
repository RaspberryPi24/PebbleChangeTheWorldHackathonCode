//
//  UIView+Extension.swift
//  Pods
//
//  Created by Franco Pieri 
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
