//
//  Color+Extensions.swift
//  Bloom
//
//  Created by 조다은 on 6/6/24.
//

import Foundation
import SwiftUI

extension Color {
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
    init(hex: UInt64) {
        let a, r, g, b: UInt64
        (a, r, g, b) = (hex >> 24, hex >> 16 & 0xFF, hex >> 8 & 0xFF, hex & 0xFF)
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
    static let baseYellow = Color(hex: "FFF4C4")
    static let pointOrange = Color(hex: "FF9500")
    static let textOrange = Color(hex: "DD8D00")
    static let gray2 = Color(hex: "454545")
    static let gray3 = Color(hex: "7E7E7E")
    static let gray4 = Color(hex: "C6C6C6")
    static let gray5 = Color(hex: "D9D9D9")
    static let gray6 = Color(hex: "F3F3F3")
    static let operating = Color(hex: "309CFF")
    static let preparing = Color(hex: "FF0808")
}
