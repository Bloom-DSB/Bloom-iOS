//
//  User.swift
//  Bloom
//
//  Created by 조다은 on 6/6/24.
//

import Foundation

struct User: Codable, Identifiable {
//    let id: UUID
    let id: String
    let name: String
    let email: String
}
