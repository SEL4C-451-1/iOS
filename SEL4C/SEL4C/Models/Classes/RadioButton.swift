//
//  RadioButton.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 27/08/23.
//

import UIKit

class RadioButton: UIButton {
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    var number: Int = -1
    
    func initButton(number: Int) {
        
        self.number = number
        
        self.backgroundColor = .clear
        self.tintColor = .clear
        self.setTitle("", for: .normal)
        self.setBackgroundImage(UIImage(named: "radiobutton_unchecked")?.withRenderingMode(.automatic), for: .normal)
        self.setBackgroundImage(UIImage(named: "radiobutton_checked")?.withRenderingMode(.alwaysOriginal), for: .highlighted)
        self.setBackgroundImage(UIImage(named: "radiobutton_checked")?.withRenderingMode(.alwaysOriginal), for: .selected)

    }
}
