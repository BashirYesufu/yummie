//
//  UIView+Extensions.swift
//  Yummie
//
//  Created by mac on 7/30/21.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set { self.layer.cornerRadius = newValue}
    }
}
