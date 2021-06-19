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
            return CGSize(width: 300, height: 400)
        }
        else if collectionView == screenView.categoryCollectionView {
            return CGSize(width: 100, height: 70)
        }
        return CGSize(width: 95, height: 95)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == screenView.categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            cell.backgroundColor = #colorLiteral(red: 0.2616666257, green: 0.3021934032, blue: 0.8887682557, alpha: 1)
            print("tapped")
        }
    }
    
}
