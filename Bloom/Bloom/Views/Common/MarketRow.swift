//
//  MarketRow.swift
//  Bloom
//
//  Created by 조다은 on 6/12/24.
//

import SwiftUI

struct MarketRow: View {
    var market: Market

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(10)
                    .padding(.bottom, 8)
                
                Button(action: {
                    // 관심 목록 추가/삭제 액션
                }) {
                    Image(systemName: "heart.fill")
                        .padding(10)
                        .background(.white)
                        .foregroundStyle(Color.pointOrange)
                        .clipShape(Circle())
                }
                .padding(10)
            }
            
            HStack {
                Text("\(market.name)")
                    .font(.pretendardSemiBold(size: 18))

                Spacer()
                
                Text("\(market.interestCount)")
//                    .padding(4)
//                    .font(.pretendardRegular(size: 12))
//                    .frame(width: 51, height: 22)
//                    .foregroundStyle(market.status == "운영중" ? Color.operating :
//                                        Color.preparing)
//                    .background(market.status == "운영중" ? Color(hex: "E4F7FF"): Color(hex: "FFE1E1"))
//                    .cornerRadius(99)
            }
        }
        .padding(.vertical, 3)
        .listRowSeparator(.hidden)
    }
}

#Preview {
    MarketRow(market: Market(
        id: 1,
        name: "서울마켓",
        summary: "서울에서 가장 인기 있는 마켓",
        addressDetail: "서울특별시 강남구",
        location: "강남구",
        phoneNumber: "010-1234-5678",
        sns: "http://instagram.com/seoulmarket",
        simpleProducts: [
            SimpleProduct(name: "사과", price: 1000),
            SimpleProduct(name: "바나나", price: 2000)
        ],
        interestCount: 100,
        operatingTime: [
            "Sunday": "Closed",
            "Saturday": "10:00 - 14:00",
            "Friday": "09:00 - 18:00",
            "Thursday": "09:00 - 18:00",
            "Wednesday": "09:00 - 18:00",
            "Tuesday": "09:00 - 18:00",
            "Monday": "09:00 - 18:00"
        ],
        latitude: 37.5665,
        longitude: 126.9784
        
    ))
}
