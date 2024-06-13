//
//  SearchResultsViewModel.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import Foundation
import Combine
import Alamofire

//class SearchResultsViewModel: ObservableObject {
//    @Published var products: [Product] = []
//    @Published var searchText: String = ""
//    @Published var showOnlyOperating: Bool = false
//    private var cancellables = Set<AnyCancellable>()
//
//    func searchProducts(query: String) {
//        let url = "\(NetworkConfig.baseURL)/products"
//        let params: Parameters = ["query": query]
//
//        AF.request(url, method: .get, parameters: params).responseDecodable(of: ProductResponse.self) { response in
//            switch response.result {
//            case .success(let result):
//                self.products = result.data
//                print("Fetched products: \(self.products)")
//            case .failure(let error):
//                print("Failed to fetch products: \(error.localizedDescription)")
//            }
//        }
//    }
//}


var filteredProducts: [Product] = [
    Product(
        marketId: 1,
        productId: 1,
        name: "사과",
        category: "과일",
        price: 1000,
        images: [
            "https://strbloom.blob.core.windows.net/undefined/flower_c.jpg",
            "https://strbloom.blob.core.windows.net/undefined/flower_b.jpg"
        ],
        descriptionImage: "https://strbloom.blob.core.windows.net/undefined/flower_c.jpg",
        interestCount: 100,
        caution: "알러지 주의"
    ),
    Product(
        marketId: 1,
        productId: 2,
        name: "바나나",
        category: "과일",
        price: 2000,
        images: [
            "https://strbloom.blob.core.windows.net/undefined/flower_a.jpg"
        ],
        descriptionImage: "https://strbloom.blob.core.windows.net/undefined/flower_b.jpg",
        interestCount: 150,
        caution: "없음"
    ),
    Product(
        marketId: 2,
        productId: 3,
        name: "감자",
        category: "채소",
        price: 500,
        images: [
            "https://strbloom.blob.core.windows.net/undefined/flower_a.jpg"
        ],
        descriptionImage: "https://strbloom.blob.core.windows.net/undefined/flower_a.jpg",
        interestCount: 200,
        caution: "잘 씻어서 드세요"
    )
]

class SearchResultsViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var searchText: String = ""
    @Published var showOnlyOperating: Bool = false
    private var cancellables = Set<AnyCancellable>()
    
//    init() {
//        searchProducts(query: "해바라기")
//    }
    
    func searchProducts(query: String) {
        let dummyProducts = [
            Product(
                marketId: 1,
                productId: 1,
                name: "사과",
                category: "과일",
                price: 1000,
                images: [
                    "https://strbloom.blob.core.windows.net/undefined/flower_c.jpg",
                    "https://strbloom.blob.core.windows.net/undefined/flower_b.jpg"
                ],
                descriptionImage: "https://strbloom.blob.core.windows.net/undefined/flower_c.jpg",
                interestCount: 100,
                caution: "알러지 주의"
            ),
            Product(
                marketId: 1,
                productId: 2,
                name: "바나나",
                category: "과일",
                price: 2000,
                images: [
                    "https://strbloom.blob.core.windows.net/undefined/flower_a.jpg"
                ],
                descriptionImage: "https://strbloom.blob.core.windows.net/undefined/flower_b.jpg",
                interestCount: 150,
                caution: "없음"
            ),
            Product(
                marketId: 2,
                productId: 3,
                name: "감자",
                category: "채소",
                price: 500,
                images: [
                    "https://strbloom.blob.core.windows.net/undefined/flower_a.jpg"
                ],
                descriptionImage: "https://strbloom.blob.core.windows.net/undefined/flower_a.jpg",
                interestCount: 200,
                caution: "잘 씻어서 드세요"
            )
        ]
        
        self.products = dummyProducts
    }
}
