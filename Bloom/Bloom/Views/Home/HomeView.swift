//
//  HomeView.swift
//  Bloom
//
//  Created by 조다은 on 6/6/24.
//

import SwiftUI
import Combine

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @Binding var hideTabBar: Bool
    @Binding var showPicker: Bool
    @Binding var selectedCity: String
    @Binding var selectedDistrict: String
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    showPicker.toggle()
                }) {
                    HStack {
                        Image("bloom-icon")
                        Text("\(selectedCity) \(selectedDistrict)")
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
                HomeSearchTextField(text: $homeViewModel.searchText)
                
                NavigationLink(destination: FilterView(hideTabBar: $hideTabBar)) {
                    Image("filter-icon")
                        .frame(width: 44, height: 44)
                        .background(Color.baseYellow)
                        .foregroundStyle(Color.pointOrange)
                        .cornerRadius(8)
                        .padding(.leading, 2)
                }
            }
            
            List(homeViewModel.markets) { market in
                MarketRow(viewModel: homeViewModel, market: market)
            }
            .listStyle(PlainListStyle())
        }
        .onAppear {
            homeViewModel.loadMarkets(location: selectedDistrict)
            print("load markets \n \(homeViewModel.markets.first?.name ?? "")")
        }
    }
}

#Preview {
    HomeView(homeViewModel: HomeViewModel(), hideTabBar: .constant(false), showPicker: .constant(false), selectedCity: .constant("서울특별시"), selectedDistrict: .constant("강남구"))
}
