//
//  ReviewsService.swift
//  shamo
//
//  Created by Shamo Zahidov on 04/12/2021.
//

import Foundation
import Firebase

protocol ReviewsServiceProtocol {
    func pushReviews(model: ReviewsModel, completion: @escaping (Error?) -> Void)
    func fetchReviews(completion: @escaping ([ReviewsModel]?, Error?) -> Void)
}

class ReviewsService: ReviewsServiceProtocol {
    
    let db = Firestore.firestore()
    private var reviews: [ReviewsModel] = []
    
    func pushReviews(model: ReviewsModel, completion: @escaping (Error?) -> Void) {
        let docData = try! FirestoreEncoder().encode(model)
        db.collection("reviews").addDocument(data: docData) { error in
            guard let err = error else { completion(nil); return }
            completion(err)
        }
    }
    
    func fetchReviews(completion: @escaping ([ReviewsModel]?, Error?) -> Void) {
        self.reviews.removeAll()
        db.collection("reviews").order(by: "time").getDocuments { document, error in
            if let err = error {
                completion(nil, err)
            } else if let documents = document?.documents {
                for docs in documents {
                    let data = docs.data()
                    let model = try! FirestoreDecoder().decode(ReviewsModel.self, from: data)
                    self.reviews.append(model)
                }
                completion(self.reviews.reversed(), nil)
            }
        }
    }
}
