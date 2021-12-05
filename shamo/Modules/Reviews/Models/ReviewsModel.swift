//
//  ReviewsModel.swift
//  shamo
//
// Created by Shamo Zahidov on 04/12/2021.
//

import Foundation

struct ReviewsModel: Codable {
    let message: String
    let stars: String
    let userId: String
    let userName: String
    let time: String
    
    enum CodingKeys: String, CodingKey {
        case message, stars, userId, userName, time
    }
}
