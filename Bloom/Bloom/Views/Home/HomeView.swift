//
//  HomeView.swift
//  Bloom
//
//  Created by 조다은 on 6/6/24.
//

import SwiftUI
import Combine

struct Market: Identifiable {
    let id: UUID
    let name: String
    let location: String
    let price: String
    let status: String
}

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

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        // 지역 선택 액션 추가
                    }) {
                        HStack {
                            Image(systemName: "map")
                            Text("서울시 강남구")
                            Image(systemName: "chevron.down")
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                HStack {
                    TextField("소중한 사람에게 장미를 🌸", text: $viewModel.searchText)
                        .padding(.horizontal)
                        .frame(height: 40)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    Button(action: {
                        // 필터 모달 추가
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
                
                List(viewModel.markets) { market in
                    VStack(alignment: .leading) {
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipped()
                            .cornerRadius(10)
                        
                        HStack {
                            Text(market.name)
                                .font(.headline)
                            Spacer()
                            Text(market.status)
                                .font(.caption)
                                .foregroundColor(market.status == "운영중" ? .blue : .red)
                                .padding(4)
                                .background(market.status == "운영중" ? Color.blue.opacity(0.2) : Color.red.opacity(0.2))
                                .cornerRadius(5)
                        }
                        Text(market.location)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text(market.price)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        HStack {
                            Spacer()
                            Button(action: {
                                // 관심 목록 추가/삭제 액션
                            }) {
                                Image(systemName: "heart")
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


#Preview {
    HomeView()
}
