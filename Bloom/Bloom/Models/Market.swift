//
//  Market.swift
//  Bloom
//
//  Created by 조다은 on 6/6/24.
//

import Foundation

struct Market: Codable, Identifiable {
    let id: UUID
    let name: String
    let location: String
    let price: String
    let status: String
}
