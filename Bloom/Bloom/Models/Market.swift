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
    var id: Int
    var name: String
    var summary: String
    var addressDetail: String
    var location: String
    var phoneNumber: String
    var sns: String
    var simpleProducts: [SimpleProduct]
    var interestCount: Int
    var operatingTime: [String: String]
    var latitude: Double
    var longitude: Double
    
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
