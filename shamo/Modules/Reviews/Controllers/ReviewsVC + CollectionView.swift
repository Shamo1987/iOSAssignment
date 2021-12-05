//
//  ReviewsVC + CollectionView.swift
//  shamo
//
//   Created by Shamo Zahidov on 04/12/2021
//

import Foundation
import UIKit

extension ReviewsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
            return CGSize(width: (UIScreen.main.bounds.width) - 10, height: 95)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.reviewsModel.count - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewsCell.identifier, for: indexPath) as! ReviewsCell
        cell.configCellViews(model: self.reviewsModel[indexPath.item + 1])
        return cell
    }
}
