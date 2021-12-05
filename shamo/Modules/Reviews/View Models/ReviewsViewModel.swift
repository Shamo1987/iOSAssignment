//
//  ReviewsViewModel.swift
//  shamo
//
//  Created by Shamo Zahidov on 04/12/2021.
//

import Foundation

protocol ReviewsDelegate {
    func didUpdateReviews(_ reviews: [ReviewsModel]?)
}

class ReviewsViewModel: NSObject {
    
    private var service: ReviewsServiceProtocol
    var delegate: ReviewsDelegate?
    static var shared = ReviewsViewModel()
    
    init(service: ReviewsServiceProtocol = ReviewsService()) {
        self.service = service
    }
    
    func pushReviews(model: ReviewsModel, completion: @escaping ((String?) -> Void)) {
        guard self.validateDataModel(dataModel: model) else { completion("Please make sure you enter your name and feedback."); return}
        self.service.pushReviews(model: model) { error in
            guard error != nil else { completion(nil); return }
            completion(error?.localizedDescription)
        }
    }
    
    func fetchReviews() {
        self.service.fetchReviews { reviews, error in
            if error != nil {
                self.delegate?.didUpdateReviews(nil)
            } else if let reviews = reviews {
                self.delegate?.didUpdateReviews(reviews)
            }
        }
    }
}

private extension ReviewsViewModel {
    
    func validateDataModel(dataModel: ReviewsModel) -> Bool {
        let name = dataModel.userName.trimmingCharacters(in: .whitespacesAndNewlines)
        let message = dataModel.message.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !name.isEmpty, !message.isEmpty else { return false }
        guard name != "", message != "" else { return false }
        return true
    }
}
