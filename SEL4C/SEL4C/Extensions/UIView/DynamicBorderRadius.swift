//
//  DynamicBorderRadius.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 21/09/23.
//

import Foundation
import UIKit

extension UIView {
    func setCornerRadius(_ radius: CGFloat = 10.0) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}
