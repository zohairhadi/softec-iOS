//
//  CategoryCollectionViewCell.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var catLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureXib()
    }
    
    func configureXib(){
        catLabel.layer.masksToBounds = true
        catLabel.layer.cornerRadius = 8
        
        catLabel.layer.borderColor = #colorLiteral(red: 0.2616666257, green: 0.3021934032, blue: 0.8887682557, alpha: 1)
        catLabel.layer.borderWidth = 1
    }

}
