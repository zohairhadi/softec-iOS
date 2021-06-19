//
//  ProductCollectionViewCell.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var transparentView: UIView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        transparentView.layer.masksToBounds = true
        transparentView.layer.cornerRadius = 8
        
//        transparentView.layer.masksToBounds = true
//        transparentView.layer.cornerRadius = 8
    }

}
