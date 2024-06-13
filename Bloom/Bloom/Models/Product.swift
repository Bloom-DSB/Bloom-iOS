//
//  Flower.swift
//  Bloom
//
//  Created by 조다은 on 6/6/24.
//

import Foundation

struct SimpleProduct: Codable, Identifiable {
    var id: Int
    let marketId: Int
    let name: String
    let category: String
    let color: String
    let price: Int
    let descriptionImage: String
    let share: String
    let interestCount: Int
    let caution: String
    let images: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "productId"
        case marketId, name, category, color, price, descriptionImage, share, interestCount, caution, images
    }
}

struct Product: Codable, Identifiable {
    let marketId: Int
    var id: Int
    let name: String
    let category: String
    let price: Int
    let images: [String]
    let descriptionImage: String
    let share: String
    let interestCount: Int
    let caution: String
    
    enum CodingKeys: String, CodingKey {
        case id = "productId"
        case marketId, name, category, price
        case images = "image"
        case descriptionImage, share, interestCount, caution
    }
}

struct ProductResponse: Codable {
    let status: Bool
    let data: [Product]
    let message: String
}
