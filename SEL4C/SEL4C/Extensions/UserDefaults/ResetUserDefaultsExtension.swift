//
//  ResetUserDefaultsExtension.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 06/10/23.
//

import Foundation

extension UserDefaults {
    
    // Method that removes all non-default keys
    func reset() {
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
}
