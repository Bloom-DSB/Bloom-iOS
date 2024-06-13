//
//  FavoriteMarketsViewModel.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import Foundation

class FavoriteMarketsViewModel: ObservableObject {
    @Published var markets: [Market] = []
    
    init() {
        loadFavoriteMarkets()
    }
    
    func loadFavoriteMarkets() {
        let dummyMarkets = [
            Market(
                id: 1,
                name: "가든 플라워 라우라",
                summary: "최고의 꽃을 제공하는 플라워 마켓",
                addressDetail: "서울특별시 강남구 서초동",
                location: "강남구 서초동",
                phoneNumber: "010-1234-5678",
                sns: "http://instagram.com/garden_flower_laura",
                simpleProducts: [
                    SimpleProduct(id: 1, marketId: 22222314, name: "장미 한송이", category: "꽃 한송이", color: "레드", price: 5000, descriptionImage: "redRose.png", share: "http://example.com/share1", interestCount: 100, caution: "조심히 다뤄주세요.", images: ["https://example.com/image1"]),
                    SimpleProduct(id: 2, marketId: 222, name: "튤립 한송이", category: "꽃 한송이", color: "옐로우", price: 4000, descriptionImage: "yellowTulip.png", share: "http://example.com/share2", interestCount: 80, caution: "햇빛에 두지 마세요.", images: ["https://example.com/image2"])
                ],
                interestCount: 200,
                operatingTime: [
                    "Monday": "09:00 - 18:00",
                    "Tuesday": "09:00 - 18:00",
                    "Wednesday": "09:00 - 18:00",
                    "Thursday": "09:00 - 18:00",
                    "Friday": "09:00 - 18:00",
                    "Saturday": "10:00 - 14:00",
                    "Sunday": "Closed"
                ],
                isOperation: true,
                coordinate: Market.Coordinate(latitude: 37.4979, longitude: 127.0276)
            ),
            Market(
                id: 2,
                name: "플라워 앤 플랜트",
                summary: "다양한 식물과 꽃을 판매하는 마켓",
                addressDetail: "서울특별시 마포구 상수동",
                location: "마포구 상수동",
                phoneNumber: "010-8765-4321",
                sns: "http://instagram.com/flower_and_plant",
                simpleProducts: [
                    SimpleProduct(id: 3, marketId: 32123, name: "화이트 데이지", category: "꽃 한송이", color: "화이트", price: 3000, descriptionImage: "whiteDaisy.png", share: "http://example.com/share3", interestCount: 90, caution: "물에 꽂아두세요.", images: ["https://example.com/image3"]),
                    SimpleProduct(id: 4, marketId: 23123, name: "핑크 장미", category: "꽃 한송이", color: "핑크", price: 6000, descriptionImage: "pinkRose.png", share: "http://example.com/share4", interestCount: 110, caution: "조심히 다뤄주세요.", images: ["https://example.com/image4"])
                ],
                interestCount: 150,
                operatingTime: [
                    "Monday": "10:00 - 19:00",
                    "Tuesday": "10:00 - 19:00",
                    "Wednesday": "10:00 - 19:00",
                    "Thursday": "10:00 - 19:00",
                    "Friday": "10:00 - 19:00",
                    "Saturday": "11:00 - 15:00",
                    "Sunday": "Closed"
                ],
                isOperation: true,
                coordinate: Market.Coordinate(latitude: 37.5475, longitude: 126.9226)
            ),
            Market(
                id: 3,
                name: "블루밍 가든",
                summary: "신선한 꽃을 제공하는 플라워 가게",
                addressDetail: "서울특별시 강동구 천호동",
                location: "강동구 천호동",
                phoneNumber: "010-1357-2468",
                sns: "http://instagram.com/blooming_garden",
                simpleProducts: [
                    SimpleProduct(id: 5, marketId: 1123, name: "파란 장미", category: "꽃 한송이", color: "블루", price: 7000, descriptionImage: "blueRose.png", share: "http://example.com/share5", interestCount: 95, caution: "햇빛에 두지 마세요.", images: ["https://example.com/image5"]),
                    SimpleProduct(id: 6, marketId: 23123, name: "보라 튤립", category: "꽃 한송이", color: "퍼플", price: 6500, descriptionImage: "purpleTulip.png", share: "http://example.com/share6", interestCount: 85, caution: "물을 주기 전 확인하세요.", images: ["https://example.com/image6"])
                ],
                interestCount: 180,
                operatingTime: [
                    "Monday": "09:00 - 18:00",
                    "Tuesday": "09:00 - 18:00",
                    "Wednesday": "09:00 - 18:00",
                    "Thursday": "09:00 - 18:00",
                    "Friday": "09:00 - 18:00",
                    "Saturday": "10:00 - 16:00",
                    "Sunday": "Closed"
                ],
                isOperation: false,
                coordinate: Market.Coordinate(latitude: 37.5384, longitude: 127.1238)
            ),
            Market(
                id: 4,
                name: "플로라 플라워 샵",
                summary: "예쁜 꽃다발과 화분을 판매하는 가게",
                addressDetail: "서울특별시 서초구 반포동",
                location: "서초구 반포동",
                phoneNumber: "010-2468-1357",
                sns: "http://instagram.com/flora_flower_shop",
                simpleProducts: [
                    SimpleProduct(id: 7, marketId: 2222, name: "노란 해바라기", category: "꽃 한송이", color: "옐로우", price: 5000, descriptionImage: "yellowSunflower.png", share: "http://example.com/share7", interestCount: 105, caution: "물을 자주 갈아주세요.", images: ["https://example.com/image7"]),
                    SimpleProduct(id: 8, marketId: 222, name: "흰 백합", category: "꽃 한송이", color: "화이트", price: 8000, descriptionImage: "whiteLily.png", share: "http://example.com/share8", interestCount: 115, caution: "조심히 다뤄주세요.", images: ["https://example.com/image8"])
                ],
                interestCount: 220,
                operatingTime: [
                    "Monday": "09:00 - 19:00",
                    "Tuesday": "09:00 - 19:00",
                    "Wednesday": "09:00 - 19:00",
                    "Thursday": "09:00 - 19:00",
                    "Friday": "09:00 - 19:00",
                    "Saturday": "10:00 - 17:00",
                    "Sunday": "Closed"
                ],
                isOperation: true,
                coordinate: Market.Coordinate(latitude: 37.5058, longitude: 127.0118)
            ),
            Market(
                id: 5,
                name: "플라워 드림",
                summary: "최고의 품질을 자랑하는 플라워 샵",
                addressDetail: "서울특별시 송파구 잠실동",
                location: "송파구 잠실동",
                phoneNumber: "010-3698-7412",
                sns: "http://instagram.com/flower_dream",
                simpleProducts: [
                    SimpleProduct(id: 9, marketId: 22222, name: "빨간 장미", category: "꽃 한송이", color: "레드", price: 6000, descriptionImage: "redRose.png", share: "http://example.com/share9", interestCount: 125, caution: "물에 꽂아두세요.", images: ["https://example.com/image9"]),
                    SimpleProduct(id: 10, marketId: 2222, name: "분홍 백합", category: "꽃 한송이", color: "핑크", price: 7500, descriptionImage: "pinkLily.png", share: "http://example.com/share10", interestCount: 95, caution: "조심히 다뤄주세요.", images: ["https://example.com/image10"])
                ],
                interestCount: 250,
                operatingTime: [
                    "Monday": "10:00 - 18:00",
                    "Tuesday": "10:00 - 18:00",
                    "Wednesday": "10:00 - 18:00",
                    "Thursday": "10:00 - 18:00",
                    "Friday": "10:00 - 18:00",
                    "Saturday": "11:00 - 16:00",
                    "Sunday": "Closed"
                ],
                isOperation: true,
                coordinate: Market.Coordinate(latitude: 37.5124, longitude: 127.1022)
            )
        ]

        self.markets = dummyMarkets
    }
}

