//
//  PreviousViewControllerExtension.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 07/10/23.
//

import Foundation
import UIKit

extension UIViewController {

    var previousViewController: UIViewController? {
        guard
            let viewControllers = navigationController?.viewControllers,
            let index = viewControllers.firstIndex(of: self),
            index > 0
        else { return nil }
        
        return viewControllers[index - 1]
    }
}
