//
//  ReviewsCell.swift
//  shamo
//
//  Created by Shamo Zahidov on 04/12/2021.
//

import UIKit
import Cosmos

class ReviewsCell: UICollectionViewCell {
    static let identifier: String = "ReviewsCell"
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func configCellViews(model: ReviewsModel) {
        self.userNameLbl.text = model.userName
        self.descriptionLbl.text = model.message
        self.cosmosView.rating = Double(model.stars) ?? 0
        let date = Util.buildDatefromMillis(millis: model.time)
        let time = date?.getElapsedInterval()
        self.timeLbl.text = time
    }
}
