//
//  FavoriteProductsViewModel.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import Foundation

class FavoriteProductsViewModel: ObservableObject {
    @Published var products: [SimpleProduct] = []
    
    init() {
        loadFavoriteProducts()
    }
    
    func loadFavoriteProducts() {
        let dummyProducts = [
            SimpleProduct(
                id: 1,
                simpleMarket: SimpleMarket(id: 1, name: "어쩌고가게", isOperation: true, location: "여기", phoneNumber: "010"),
                name: "고백공격 장미꽃",
                category: "꽃 한송이",
                color: "레드",
                price: 19900,
                descriptionImage: "flower1",
                share: "https://example.com/share1",
                interestCount: 100,
                caution: "조심히 다뤄주세요.",
                images: ["https://example.com/image1"]
            ),
            SimpleProduct(
                id: 2,
                simpleMarket: SimpleMarket(id: 1, name: "어쩌고가게", isOperation: true, location: "여기", phoneNumber: "010"),
                name: "세상에서 제일 예쁜 꽃",
                category: "꽃 한송이",
                color: "핑크",
                price: 15000,
                descriptionImage: "flower2",
                share: "https://example.com/share2",
                interestCount: 120,
                caution: "햇빛에 두지 마세요.",
                images: ["https://example.com/image2"]
            ),
            SimpleProduct(
                id: 3,
                simpleMarket: SimpleMarket(id: 1, name: "어쩌고가게", isOperation: true, location: "여기", phoneNumber: "010"),
                name: "로맨틱 튤립",
                category: "꽃 한송이",
                color: "옐로우",
                price: 12000,
                descriptionImage: "flower3",
                share: "https://example.com/share3",
                interestCount: 110,
                caution: "물을 자주 갈아주세요.",
                images: ["https://example.com/image3"]
            ),
            SimpleProduct(
                id: 4,
                simpleMarket: SimpleMarket(id: 1, name: "어쩌고가게", isOperation: true, location: "여기", phoneNumber: "010"),
                name: "봄의 정원",
                category: "꽃 한송이",
                color: "화이트",
                price: 25000,
                descriptionImage: "flower4",
                share: "https://example.com/share4",
                interestCount: 130,
                caution: "조심히 다뤄주세요.",
                images: ["https://example.com/image4"]
            ),
            SimpleProduct(
                id: 5,
                simpleMarket: SimpleMarket(id: 1, name: "어쩌고가게", isOperation: true, location: "여기", phoneNumber: "010"),
                name: "파란 해바라기",
                category: "꽃 한송이",
                color: "블루",
                price: 17000,
                descriptionImage: "flower5",
                share: "https://example.com/share5",
                interestCount: 140,
                caution: "햇빛에 두지 마세요.",
                images: ["https://example.com/image5"]
            )
        ]
        self.products = dummyProducts
    }
}
