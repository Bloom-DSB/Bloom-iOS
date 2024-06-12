//
//  MarketRow.swift
//  Bloom
//
//  Created by 조다은 on 6/12/24.
//

import SwiftUI

struct MarketRow: View {
    @ObservedObject var viewModel: HomeViewModel
    var market: Market
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                HStack(spacing: 0) {
                    // 왼쪽 큰 이미지
                    AsyncImage(url: URL(string: market.simpleProducts[0].images[0])) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.57, height: 160)
                    .clipped()
                    
                    VStack(spacing: 0) {
                        // 오른쪽 상단 작은 이미지
                        AsyncImage(url: URL(string: market.simpleProducts[0].images[0])) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.33, height: 80)
                        .clipped()
                        
                        // 오른쪽 하단 작은 이미지
                        AsyncImage(url: URL(string: market.simpleProducts[0].images[0])) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.33, height: 80)
                        .clipped()
                    }
                }
                .padding(.bottom, 2)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.clear, lineWidth: 0)
                )
                
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
                
                Text(viewModel.isOperating(market: market) ? "운영중" : "휴무중")
                    .padding(4)
                    .font(.pretendardRegular(size: 12))
                    .frame(width: 60, height: 22)
                    .foregroundStyle(viewModel.isOperating(market: market) ? Color.operating : Color.preparing)
                    .background(viewModel.isOperating(market: market) ? Color(hex: "E4F7FF"): Color(hex: "FFE1E1"))
                    .cornerRadius(99)
            }

            HStack {
                HStack {
                    Image("location-icon")
                    
                    Text("\(market.location)")
                        .font(.pretendardRegular(size: 15))
                        .foregroundStyle(Color.gray2)
                }
                
                Spacer()
                
                Text("\(market.summary)")
                    .font(.pretendardRegular(size: 14))
                    .foregroundStyle(Color.gray3)
            }
        }
        .padding(.vertical, 3)
        .listRowSeparator(.hidden)
    }
}

//#Preview {
//    MarketRow(viewModel: HomeViewModel(), market: Market(
//        id: 1,
//        name: "서울마켓",
//        summary: "서울에서 가장 인기 있는 마켓",
//        addressDetail: "서울특별시 강남구",
//        location: "강남구",
//        phoneNumber: "010-1234-5678",
//        sns: "http://instagram.com/seoulmarket",
//        simpleProducts: [
//            SimpleProduct(name: "사과", price: 1000),
//            SimpleProduct(name: "바나나", price: 2000)
//        ],
//        interestCount: 100,
//        operatingTime: [
//            "Sunday": "Closed",
//            "Saturday": "10:00 - 14:00",
//            "Friday": "09:00 - 18:00",
//            "Thursday": "09:00 - 18:00",
//            "Wednesday": "09:00 - 18:00",
//            "Tuesday": "09:00 - 18:00",
//            "Monday": "09:00 - 18:00"
//        ],
//        latitude: 37.5665,
//        longitude: 126.9784
//        
//    )
//    )
//}
