//
//  Market.swift
//  Bloom
//
//  Created by 조다은 on 6/6/24.
//

import Foundation

struct Market: Codable, Identifiable {
    let id: Int
    let name: String
    let summary: String
    let addressDetail: String
    let location: String
    let phoneNumber: String
    let sns: String
    let simpleProducts: [SimpleProduct]
    let interestCount: Int
    let operatingTime: [String: String]
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case id = "marketId"
        case name, summary, addressDetail, location, phoneNumber, sns, simpleProducts, interestCount, operatingTime, latitude, longitude
    }
}

struct SimpleProduct: Codable, Identifiable {
    let id: Int
    let name: String
    let price: Int
    let images: [String]

    enum CodingKeys: String, CodingKey {
        case id = "productId"
        case name, price, images
    }
}

struct MarketResponse: Codable {
    let status: Bool
    let data: [Market]
    let message: String
}
