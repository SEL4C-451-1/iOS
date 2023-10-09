//
//  RootCollectionViewCell.swift
//  SEL4C
//
//  Created by Esther Ramírez on 09/10/23.
//

import UIKit

class RootCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var myImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = UIColor.clear
        myImage.layer.cornerRadius = myImage.bounds.size.width / 2
        myImage.clipsToBounds = true
       
    }

}
