//
//  HomeViewModel.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import Foundation
import Alamofire
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var markets: [Market] = []
    @Published var searchText: String = ""
    
    init() {
        loadMarkets(location: "강남구")
    }
    
    func loadMarkets(location: String) {
        let url = "\(NetworkConfig.baseURL)/markets"
        let params: Parameters = ["location": location]
        
        AF.request(url, method: .get, parameters: params).responseDecodable(of: MarketResponse.self) { response in
            switch response.result {
            case .success(let result):
                self.markets = result.data
                print("load markets \n \(self.markets)")
            case .failure(let error):
                print("Failed to fetch markets: \(error.localizedDescription)")
            }
        }
    }
    
    func isOperating(market: Market) -> Bool {
        // 현재 시각을 한국 시간대로 설정
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        let today = dateFormatter.string(from: now)
        
        guard let operatingHours = market.operatingTime[today] else {
            return false
        }
        
        if operatingHours == "Closed" {
            return false
        }
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        
        let operatingTimes = operatingHours.split(separator: "-").map { $0.trimmingCharacters(in: .whitespaces) }
        guard operatingTimes.count == 2 else {
            return false
        }
        
        guard let startTime = timeFormatter.date(from: operatingTimes[0]),
              let endTime = timeFormatter.date(from: operatingTimes[1]) else {
            return false
        }
        
        let currentTime = timeFormatter.date(from: timeFormatter.string(from: now))!
        
        return currentTime >= startTime && currentTime <= endTime
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
//            Market(
//                id: 1,
//                name: "서울마켓",
//                summary: "서울에서 가장 인기 있는 마켓",
//                addressDetail: "서울특별시 강남구",
//                location: "강남구",
//                phoneNumber: "010-1234-5678",
//                sns: "http://instagram.com/seoulmarket",
//                simpleProducts: [
//                    SimpleProduct(name: "사과", price: 1000),
//                    SimpleProduct(name: "바나나", price: 2000)
//                ],
//                interestCount: 100,
//                operatingTime: [
//                    "Sunday": "Closed",
//                    "Saturday": "10:00 - 14:00",
//                    "Friday": "09:00 - 18:00",
//                    "Thursday": "09:00 - 18:00",
//                    "Wednesday": "09:00 - 18:00",
//                    "Tuesday": "09:00 - 18:00",
//                    "Monday": "09:00 - 18:00"
//                ],
//                latitude: 37.5665,
//                longitude: 126.9784
//            ),
//            Market(
//                id: 2,
//                name: "부산마켓",
//                summary: "부산에서 유명한 해운대 마켓",
//                addressDetail: "부산광역시 해운대구",
//                location: "해운대구",
//                phoneNumber: "051-9876-5432",
//                sns: "http://instagram.com/busanmarket",
//                simpleProducts: [
//                    SimpleProduct(name: "감자", price: 500)
//                ],
//                interestCount: 200,
//                operatingTime: [
//                    "Sunday": "Closed",
//                    "Saturday": "10:00 - 14:00",
//                    "Friday": "09:00 - 18:00",
//                    "Thursday": "09:00 - 18:00",
//                    "Wednesday": "09:00 - 18:00",
//                    "Tuesday": "09:00 - 18:00",
//                    "Monday": "09:00 - 18:00"
//                ],
//                latitude: 35.16,
//                longitude: 129.158
//            )
//        ]
//        self.markets = dummyMarkets
//    }
//    
//
//}
