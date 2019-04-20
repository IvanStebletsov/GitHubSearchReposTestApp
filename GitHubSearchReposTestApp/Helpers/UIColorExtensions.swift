//
//  UIColorExtensions.swift
//  TestECommerceApp
//
//  Created by Ivan Stebletsov on 04/02/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: alpha)
    }

}
