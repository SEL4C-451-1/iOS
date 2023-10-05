//
//  HeightProgressBar.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 21/09/23.
//

import UIKit

class HeightProgressBar: UIProgressView {

    override func layoutSubviews() {
        super.layoutSubviews()

        let maskLayerPath = UIBezierPath(roundedRect: bounds, cornerRadius: 7.5)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskLayerPath.cgPath
        layer.mask = maskLayer
    }
}
