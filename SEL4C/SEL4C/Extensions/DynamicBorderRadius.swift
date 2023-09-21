//
//  DynamicBorderRadius.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 21/09/23.
//

import Foundation
import UIKit

extension UIView {
    public var cornerRadiusRatio: CGFloat {
        get {
            return layer.cornerRadius / frame.width
        }

        set {
            // Make sure that it's between 0.0 and 1.0. If not, restrict it
            // to that range.
            let normalizedRatio = max(0.0, min(1.0, newValue))
            layer.cornerRadius = frame.width * normalizedRatio
        }
    }
}
