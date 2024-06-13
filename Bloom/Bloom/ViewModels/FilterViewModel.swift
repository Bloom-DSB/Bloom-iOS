//
//  FilterViewModel.swift
//  Bloom
//
//  Created by 조다은 on 6/12/24.
//

import SwiftUI
import Combine
import Alamofire

class FilterViewModel: ObservableObject {
    @Published var selectedCategory: String? = nil
    @Published var selectedColors: Set<String> = []
    @Published var minPrice: Int = 0
    @Published var maxPrice: Int = 100000
    
    func buildQueryParameters() -> [String: String] {
        var params: [String: String] = [:]
        
        if let category = selectedCategory {
            params["category"] = category
        }
        
        if minPrice > 0 {
            params["minPrice"] = "\(minPrice)"
        }
        
        if maxPrice < 100000 {
            params["maxPrice"] = "\(maxPrice)"
        }
        
        if !selectedColors.isEmpty {
            params["color"] = selectedColors.joined(separator: ",")
        }
        
        return params
    }
}
