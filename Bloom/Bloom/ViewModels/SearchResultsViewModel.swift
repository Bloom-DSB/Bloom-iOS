//
//  SearchResultsViewModel.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import SwiftUI
import Combine
import Alamofire

class SearchResultsViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var searchText: String = ""
    @Published var showOnlyOperating: Bool = false
    
    func searchProducts(query: String, filterParams: [String: String] = [:]) {
        let url = "\(NetworkConfig.baseURL)/products"
        
        var params = filterParams
        params["query"] = query
        
        print("params: \(filterParams)")
        print("query: \(query)")
        
        AF.request(url, method: .get, parameters: params).responseDecodable(of: ProductResponse.self) { response in
            switch response.result {
            case .success(let result):
                self.products = result.data
            case .failure(let error):
                print("Failed to fetch products: \(error.localizedDescription)")
            }
        }
    }
}
