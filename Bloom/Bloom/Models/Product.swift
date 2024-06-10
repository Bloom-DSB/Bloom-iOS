//
//  Flower.swift
//  Bloom
//
//  Created by 조다은 on 6/6/24.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: UUID
    let name: String
    let price: String
    let imageName: String
    let status: String
}

struct ProductDetail: Codable, Identifiable {
    let id: UUID
    let name: String
    let price: String
    let imageName: String
    let description: String
    let packagingMethod: String
    let storageMethod: String
    let caution: String
    let marketName: String
    let marketStatus: String
    let marketLocation: String
}
