//
//  Market.swift
//  Bloom
//
//  Created by 조다은 on 6/6/24.
//

import Foundation
import CoreLocation

struct SimpleMarket: Codable, Identifiable {
    var id: Int
    let name: String
    let operatingTime: [String: String]
    let location: String
    let phoneNumber: String
}

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
    let isOperation: Bool
    
    private var coordinate: Coordinate
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
    
    struct Coordinate: Hashable, Codable {
        let latitude: Double
        let longitude: Double
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "marketId"
        case name, summary, addressDetail, location, phoneNumber, sns, simpleProducts, interestCount, operatingTime, isOperation, coordinate
    }
}

struct MarketResponse: Codable {
    let status: Bool
    let data: [Market]
    let message: String
}
