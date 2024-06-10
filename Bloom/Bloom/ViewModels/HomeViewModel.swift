//
//  HomeViewModel.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var markets: [Market] = []
    @Published var searchText: String = ""
    
    init() {
        loadMarkets()
    }
    
    func loadMarkets() {
        let dummyMarkets = [
            Market(id: UUID(), name: "가든 플라워 라우라", location: "강남구 서초동", price: "1000원부터", status: "운영중"),
            Market(id: UUID(), name: "가든 플라워 라우라", location: "강남구 서초동", price: "1000원부터", status: "준비중")
        ]
        self.markets = dummyMarkets
    }
}
