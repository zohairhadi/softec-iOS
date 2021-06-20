//
//  CartViewController.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//
import UIKit

class CartViewController: UIViewController {
    //MARK:- Variables and Constants
//    var screenView = RegularCartView()
    var locationAddress = String()

    //MARK:- View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureScreen()
        hideKeyboardWhenTappedAround()
    }
    
    //MARK:- objc Functions
    @objc func nextButtonPressed(_ sender: UIButton!){
        
    }
    
    //MARK:- Helper Functions
    private func configureScreen(){

//        // configure screen
//        screenView.configureScreen(view: self.view)
        
        // configure outlets
//        screenView.nextButton.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
    }
}


////MARK: - Table View
//extension CartViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
//
//    //tells height and width of each collectionview cell
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 290 , height:113)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrderListCollectionViewCell", for: indexPath) as! OrderListCollectionViewCell
//
////            if videoDataModel.count == 0 {
////                return cell
////            }
//
////            DispatchQueue.main.async {
////                let modelUser = self.videoDataModel[indexPath.item]
////
////                //this statment returns error sometimes
////                guard let finalUrl = URL(string: "https://taleemabad-images-bucket.s3-eu-west-1.amazonaws.com/thumbnail/"+modelUser.videoThumbnail!+".png") else {return}
////
////                cell.bg.load(url: finalUrl)
////            }
//
//        return cell
//    }
//
//}
