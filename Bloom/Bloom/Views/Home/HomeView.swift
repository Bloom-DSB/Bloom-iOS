//
//  HomeView.swift
//  Bloom
//
//  Created by 조다은 on 6/6/24.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var markets: [Market] = []
    @Published var searchText: String = ""
    
    init() {
        loadMarkets()
    }
    
    func loadMarkets() {
        let dummyMarkets = [
            Market(id: UUID(), name: "가든 플라워 라우라", location: "강남구 서초동", price: "1000원부터", status: "운영중"),
            Market(id: UUID(), name: "가든 플라워 라우라", location: "강남구 서초동", price: "1000원부터", status: "준비중")
        ]
        self.markets = dummyMarkets
    }
}

struct SearchTextField: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.black)
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text("소중한 사람에게 장미를🌹")
                        .foregroundStyle(Color.gray3)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 4)
                        .font(.pretendardRegular(size: 15))
                }
                TextField("", text: $text)
                    .padding(.vertical, 8)
            }
        }
        .padding(.horizontal, 15)
        .frame(width: 299, height: 44)
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @Binding var hideTabBar: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Button(action: {
                            // 지역 선택 액션 추가
                        }) {
                            HStack {
                                Image("bloom-icon")
                                Text("서울시 강남구")
                                    .foregroundStyle(Color.pointOrange)
                                    .font(.pretendardBold(size: 20))
                                Image(systemName: "chevron.down")
                                    .foregroundStyle(Color.pointOrange)
                            }
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    HStack {
                        SearchTextField(text: $viewModel.searchText)
                        
                        NavigationLink(destination: FilterView(hideTabBar: $hideTabBar)) {
                            Image("filter-icon")
                                .frame(width: 44, height: 44)
                                .background(Color.baseYellow)
                                .foregroundStyle(Color.pointOrange)
                                .cornerRadius(8)
                                .padding(.leading, 2)
                        }
                    }
                    
                    List(viewModel.markets) { market in
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
                                Text(market.name)
                                    .font(.pretendardSemiBold(size: 18))
                                
                                Spacer()
                                
                                Text(market.status)
                                    .padding(4)
                                    .font(.pretendardRegular(size: 12))
                                    .frame(width: 51, height: 22)
                                    .foregroundStyle(market.status == "운영중" ? Color.operating :
                                                        Color.preparing)
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
                        .padding(.vertical, 3)
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView(hideTabBar: .constant(false))
}
