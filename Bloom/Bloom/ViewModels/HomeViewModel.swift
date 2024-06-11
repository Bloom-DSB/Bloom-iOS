//
//  HomeViewModel.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var markets: [Market] = []
    @Published var searchText: String = ""
    private var cancellables = Set<AnyCancellable>()
    
    func loadMarkets(location: String) {
        guard let url = URL(string: "\(NetworkConfig.baseURL)/markets?location=\(location)") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MarketResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Failed to fetch markets: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] response in
                self?.markets = response.data
            })
            .store(in: &cancellables)
    }
}



//class HomeViewModel: ObservableObject {
//    @Published var markets: [Market] = []
//    @Published var searchText: String = ""
//
//    init() {
//        loadMarkets()
//    }
//
//    func loadMarkets() {
//        let dummyMarkets = [
//            Market(id: UUID(), name: "가든 플라워 라우라", location: "강남구 서초동", price: "1000원부터", status: "운영중"),
//            Market(id: UUID(), name: "가든 플라워 라우라", location: "강남구 서초동", price: "1000원부터", status: "준비중")
//        ]
//        self.markets = dummyMarkets
//    }
//}
