//
//  OrderListTableViewCell.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//

import UIKit

class OrderListTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var totalItemsLabel: UILabel!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
//    var videoDataModel = [SubjHomeVideoSubTopic]()
    
    override func awakeFromNib() {
        super.awakeFromNib()

        let nib = UINib(nibName: "OrderListCollectionViewCell", bundle: nil)
        productsCollectionView?.register(nib, forCellWithReuseIdentifier: "OrderListCollectionViewCell")
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0, execute: {
//            self.productsCollectionView.reloadData()
//        })
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//MARK: - Table View
extension OrderListTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{

    //tells height and width of each collectionview cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 290 , height:113)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrderListCollectionViewCell", for: indexPath) as! OrderListCollectionViewCell

//            if videoDataModel.count == 0 {
//                return cell
//            }

//            DispatchQueue.main.async {
//                let modelUser = self.videoDataModel[indexPath.item]
//
//                //this statment returns error sometimes
//                guard let finalUrl = URL(string: "https://taleemabad-images-bucket.s3-eu-west-1.amazonaws.com/thumbnail/"+modelUser.videoThumbnail!+".png") else {return}
//
//                cell.bg.load(url: finalUrl)
//            }

        return cell
    }

}
