//
//  UIView+Extension.swift
//  Pods
//
//  Created by Franco Pieri on 4/3/23.
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
