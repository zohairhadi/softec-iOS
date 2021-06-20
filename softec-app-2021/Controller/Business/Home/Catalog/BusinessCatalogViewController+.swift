//
//  BusinessCatalogViewController+.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import UIKit


extension BusinessCatalogViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == screenView.categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
    //        let cellIndex = indexPath.item
    //        cell.profilePicImageView.image = profilePics[cellIndex]
            previousCat = IndexPath(row: 0, section: 0)
            if indexPath.row == 0 {
                cell.catLabel.backgroundColor = #colorLiteral(red: 0.2616666257, green: 0.3021934032, blue: 0.8887682557, alpha: 1)
                cell.catLabel.textColor = .white
            }
            return cell
            
        }
        else if collectionView == screenView.productsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
    //        let cellIndex = indexPath.item
    //        cell.profilePicImageView.image = profilePics[cellIndex]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == screenView.productsCollectionView {
            return CGSize(width: 220, height: 300)
        }
        else if collectionView == screenView.categoryCollectionView {
            return CGSize(width: 100, height: 40)
        }
        return CGSize(width: 95, height: 95)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        print("highhhhh")
        if collectionView == screenView.categoryCollectionView {
            //reset previous
            let pcell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: previousCat) as! CategoryCollectionViewCell
            pcell.catLabel.backgroundColor = .clear
            pcell.catLabel.textColor = #colorLiteral(red: 0.2616666257, green: 0.3021934032, blue: 0.8887682557, alpha: 1)

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            previousCat = indexPath
            cell.catLabel.backgroundColor = #colorLiteral(red: 0.2616666257, green: 0.3021934032, blue: 0.8887682557, alpha: 1)
            cell.catLabel.textColor = .white
        }
        else if collectionView == screenView.productsCollectionView {
            // add one more
            UserDefaults.standard.setValue(UserDefaults.standard.integer(forKey: "CartItems") + 1, forKey: "CartItems")
            
            if let tabItems = tabBarController?.tabBar.items {
                // In this case we want to modify the badge number of the third tab:
                let tabItem = tabItems[2]
                
                tabItem.badgeValue = "\(UserDefaults.standard.integer(forKey: "CartItems"))"
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("tapppppp")
//        if collectionView == screenView.categoryCollectionView {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
//            cell.backgroundColor = #colorLiteral(red: 0.2616666257, green: 0.3021934032, blue: 0.8887682557, alpha: 1)
//
//            if let tabItems = tabBarController?.tabBar.items {
//                // In this case we want to modify the badge number of the third tab:
//                let tabItem = tabItems[2]
//                tabItem.badgeValue = "1"
//            }
//        }
    }
}
