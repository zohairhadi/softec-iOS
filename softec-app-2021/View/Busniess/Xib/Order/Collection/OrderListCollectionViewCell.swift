//
//  OrderListCollectionViewCell.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//

import UIKit

class OrderListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productQuantityLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        productImageView.layer.masksToBounds = true
        productImageView.layer.cornerRadius = 8
    }

}
