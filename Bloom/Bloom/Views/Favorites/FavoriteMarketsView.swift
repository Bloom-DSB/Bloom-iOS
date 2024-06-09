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
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        // 뒤로가기 액션 추가
                    }) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 9, height: 18)
                    }
                    Spacer()
                    Text("관심 마켓")
                        .font(.system(size: 18, weight: .medium))
                    Spacer()
                    // 빈 버튼을 추가하여 가운데 정렬 유지
                    Image(systemName: "chevron.left")
                        .resizable()
                        .foregroundColor(.clear)
                        .frame(width: 9, height: 18)
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
                            .overlay(
                                Button(action: {
                                    // 관심 목록에서 제거하는 액션 추가
                                }) {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.orange)
                                        .padding()
                                        .background(Color.white)
                                        .clipShape(Circle())
                                }
                                    .padding(8),
                                alignment: .topTrailing
                            )
                        
                        HStack {
                            Text(market.name)
                                .font(.pretendardSemiBold(size: 18))
                            
                            Spacer()
                            
                            Text(market.status)
                                .padding(4)
                                .font(.pretendardRegular(size: 12))
                                .frame(width: 51, height: 22)
                                .foregroundColor(market.status == "운영중" ? .operating : .preparing)
                                .background(market.status == "운영중" ? Color(hex: "E4F7FF"): Color(hex: "FFE1E1"))
                                .cornerRadius(99)
                        }
                        
                        HStack(alignment: .center, content: {
                            Text(market.location)
                                .font(.pretendardRegular(size: 15))
                                .foregroundStyle(Color.gray2)
                            
                            Spacer()
                            
                            Text(market.price)
                                .font(.pretendardRegular(size: 14))
                                .foregroundStyle(Color.gray3)
                        })
                    }
                    .padding(.vertical, 8)
                    .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}


#Preview {
    FavoriteMarketsView()
}
