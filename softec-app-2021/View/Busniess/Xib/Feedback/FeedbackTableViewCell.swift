//
//  FeedbackTableViewCell.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//

import UIKit

class FeedbackTableViewCell: UITableViewCell {

    @IBOutlet weak var feedbackNameLabel: UILabel!
    @IBOutlet weak var feedbackDetailsLabel: UILabel!
    @IBOutlet weak var feedbackTimeLabel: UILabel!
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    var starArray = [UIImageView()]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        starArray.append(star1)
        starArray.append(star2)
        starArray.append(star3)
        starArray.append(star4)
        starArray.append(star5)
        
        for star in starArray {
            star.tintColor = #colorLiteral(red: 0.2616666257, green: 0.3021934032, blue: 0.8887682557, alpha: 1)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
