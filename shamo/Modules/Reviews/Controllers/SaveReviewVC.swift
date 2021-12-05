//
//  SaveReviewVC.swift
//  shamo
//
//  Created by Shamo Zahidov on 04/12/2021.
//

import UIKit

class SaveReviewVC: UIViewController {

    private var viewModel = ReviewsViewModel()
    var dataModel: ReviewsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapSave(_ sender: UIButton) {
        if let dataModel = dataModel {
            ReviewsViewModel.shared.pushReviews(model: dataModel) { error in
                if let error = error {
                    Util.showAlert(caller: self, title: "Error", message: error)
                } else {
                    Util.showAlertWithButton(caller: self, title: "Thank you for your review", message: "You’re helping others make smarter decisions every day.", buttonTitle: "Okay!", buttonStyle: .default) { [weak self] handler in
                        guard let self = self else { return }
                        self.dismiss(animated: true)
                    }
                }
            }
        }
    }
    
    @IBAction func didTapExit(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func didTapCancel(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
