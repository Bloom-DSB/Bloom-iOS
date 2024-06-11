//
//  Market.swift
//  Bloom
//
//  Created by 조다은 on 6/6/24.
//

import Foundation

struct SimpleProduct: Codable {
    let name: String
    let price: Int
}

// Market Model
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
        case name
        case summary
        case addressDetail
        case location
        case phoneNumber
        case sns
        case simpleProducts
        case interestCount
        case operatingTime
        case latitude
        case longitude
    }
}


struct MarketResponse: Codable {
    let status: Bool
    let data: [Market]
    let message: String
}
