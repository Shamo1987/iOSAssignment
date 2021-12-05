//
//  ViewController.swift
//  shamo
//
//  Created by Shamo Zahidov on 04/12/2021.
//

import UIKit
import Cosmos

class ReviewsVC: UIViewController {

    @IBOutlet weak var peoplesRatingLbl: UILabel!
    @IBOutlet weak var ratingsLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var commentLbl: UILabel!
    
    var reviewsModel: [ReviewsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
        ReviewsViewModel.shared.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ReviewsViewModel.shared.fetchReviews()
    }
    
    fileprivate func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    @IBAction func didTapAddReview(_ sender: UIButton) {
        let vc = AddReviewsVC.initFromStoryboard(.Main)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ReviewsVC: ReviewsDelegate {
func didUpdateReviews(_ reviews: [ReviewsModel]?) {
self.reviewsModel.removeAll()
DispatchQueue.main.async { [weak self] in
guard let self = self else { return }
if let reviews = reviews {
self.reviewsModel = reviews
if !self.reviewsModel.isEmpty {
let firsrtReview = self.reviewsModel[0]
self.userNameLbl.text = firsrtReview.userName
self.cosmosView.rating = Double(firsrtReview.stars) ?? 0
self.commentLbl.text = firsrtReview.message
let date = Util.buildDatefromMillis(millis: firsrtReview.time)
let time = date?.getElapsedInterval()
self.timeLbl.text = time
var rating = 0.0
for review in self.reviewsModel {
rating = rating + Double(review.stars)!
}
let getRating = rating / Double(self.reviewsModel.count)
let toStringRating = String(format: "%.1f", getRating)
self.ratingsLbl.text = toStringRating
self.peoplesRatingLbl.text = "from \(self.reviewsModel.count) ratings"
}
self.collectionView.reloadData()
} else {
Util.showAlert(caller: self, title: "Error", message: "Something went wrong.")
}
}
}
}


