//
//  Flower.swift
//  Bloom
//
//  Created by 조다은 on 6/6/24.
//

import Foundation

struct Product: Codable, Identifiable {
    let id = UUID()  // UUID 생성 (네트워크에서 받는 id와 다름)
    let marketId: Int
    let productId: Int
    let name: String
    let category: String
    let price: Int
    let images: [String]
    let descriptionImage: String
    let interestCount: Int
    let caution: String
}

struct ProductResponse: Codable {
    let status: Bool
    let data: [Product]
    let message: String
}

