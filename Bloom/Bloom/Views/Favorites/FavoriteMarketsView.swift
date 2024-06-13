//
//  FavoriteMarketsView.swift
//  Bloom
//
//  Created by 조다은 on 6/9/24.
//

import SwiftUI
import Combine

struct FavoriteMarketsView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @StateObject private var viewModel = FavoriteMarketsViewModel()
    @Binding var hideTabBar: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .padding()
                }
                Spacer()
                Text("관심 마켓")
                    .font(.system(size: 18, weight: .medium))
                    .padding(.trailing, 50)
                Spacer()
            }
            
            List(viewModel.markets) { market in
                ZStack {
                    NavigationLink(destination: MarketDetailView(hideTabBar: $hideTabBar, market: market)) { EmptyView() }.opacity(0.0)
                    MarketRow(viewModel: homeViewModel, market: market)
                }

            }
            .listStyle(PlainListStyle())
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}


#Preview {
    FavoriteMarketsView(homeViewModel: HomeViewModel(), hideTabBar: .constant(false))
}
