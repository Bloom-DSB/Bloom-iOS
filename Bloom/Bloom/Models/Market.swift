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
    let isOperation: Bool
    let location: String
    let phoneNumber: String
    
    enum CodingKeys: String, CodingKey {
        case id = "marketId"
        case name, isOperation, location, phoneNumber
    }
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
    
    init(id: Int, name: String, summary: String, addressDetail: String, location: String, phoneNumber: String, sns: String, simpleProducts: [SimpleProduct], interestCount: Int, operatingTime: [String: String], isOperation: Bool, coordinate: Coordinate) {
        self.id = id
        self.name = name
        self.summary = summary
        self.addressDetail = addressDetail
        self.location = location
        self.phoneNumber = phoneNumber
        self.sns = sns
        self.simpleProducts = simpleProducts
        self.interestCount = interestCount
        self.operatingTime = operatingTime
        self.isOperation = isOperation
        self.coordinate = coordinate
    }
}

struct MarketResponse: Codable {
    let status: Bool
    let data: [Market]
    let message: String
}
