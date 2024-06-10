//
//  MarketDetailViewModel.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import Foundation

class MarketDetailViewModel: ObservableObject {
    @Published var marketDetail: MarketDetail
    
    init() {
        self.marketDetail = MarketDetail(
            id: UUID(),
            name: "가든 플라워 라우라",
            status: "운영중",
            description: "강남역 바로 옆 초역세권 짱짱 꽃집이랍니다. 이 부분에는 글자수 제한이 있으면 좋을 것 같습니다!",
            products: [
                Product(id: UUID(), name: "고백공격 장미꽃", price: "19,900원", imageName: "flower1", status: "운영중"),
                Product(id: UUID(), name: "세상에서 제일 예쁜 꽃", price: "15,000원", imageName: "flower2", status: "준비중"),
                Product(id: UUID(), name: "고백공격 장미꽃", price: "19,900원", imageName: "flower1", status: "운영중"),
                Product(id: UUID(), name: "세상에서 제일 예쁜 꽃", price: "15,000원", imageName: "flower2", status: "준비중"),
                Product(id: UUID(), name: "로맨틱 튤립", price: "12,000원", imageName: "flower3", status: "운영중"),
                Product(id: UUID(), name: "봄의 정원", price: "25,000원", imageName: "flower4", status: "운영중")
            ],
            location: "강남구 서초동",
            mapImageName: "mapImage"
        )
    }
}
