//
//  FavoriteMarketsView.swift
//  Bloom
//
//  Created by 조다은 on 6/9/24.
//

import SwiftUI
import Combine

class FavoriteMarketsViewModel: ObservableObject {
    @Published var markets: [Market] = []
    
    init() {
        loadFavoriteMarkets()
    }
    
    func loadFavoriteMarkets() {
        let dummyMarkets = [
            Market(id: UUID(), name: "가든 플라워 라우라", location: "강남구 서초동", price: "1000원부터", status: "운영중"),
            Market(id: UUID(), name: "가든 플라워 라우라", location: "강남구 서초동", price: "1000원부터", status: "준비중")
        ]
        self.markets = dummyMarkets
    }
}


struct FavoriteMarketsView: View {
    @StateObject private var viewModel = FavoriteMarketsViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .padding()
                }
                Spacer()
                Text("관심 마켓")
                    .font(.system(size: 18, weight: .medium))
                Spacer()
                Spacer() // 오른쪽 여백을 위한 Spacer
            }
            .padding()
            
            List(viewModel.markets) { market in
                VStack(alignment: .leading) {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(10)
                        .padding(.bottom, 8)
                    
                    HStack {
                        Text(market.name)
                            .font(.pretendardSemiBold(size: 18))
                        Spacer()
                        Text(market.status)
                            .padding(4)
                            .font(.caption)
                            .foregroundColor(market.status == "운영중" ? Color.operating : Color.preparing)
                            .frame(width: 51, height: 22)
                            .background(market.status == "운영중" ? Color(hex: "E4F7FF"): Color(hex: "FFE1E1"))
                            .cornerRadius(99)
                    }
                    
                    HStack {
                        Text(market.location)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text(market.price)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            // 관심 목록 추가/삭제 액션
                        }) {
                            Image(systemName: "heart")
                                .padding()
                                .background(.white)
                                .cornerRadius(8)
                        }
                    }
                }
                .padding(.vertical, 8)
            }
            .listStyle(PlainListStyle())
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}


#Preview {
    FavoriteMarketsView()
}
