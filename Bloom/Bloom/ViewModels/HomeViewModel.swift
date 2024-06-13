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

    func loadMarkets(location: String) {
        let url = "\(NetworkConfig.baseURL)/markets"
        let params: Parameters = ["location": location]
        
        print("load요청한 지역: \(location)")
        
        AF.request(url, method: .get, parameters: params).responseDecodable(of: MarketResponse.self) { response in
            switch response.result {
            case .success(let result):
                print(result)
//                self.markets = result.data
//              관심 수 기준으로 내림차순 정렬
                self.markets = result.data.sorted(by: { $0.interestCount > $1.interestCount })
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
