//
//  FavoriteProductsView.swift
//  Bloom
//
//  Created by 조다은 on 6/9/24.
//

import SwiftUI
import Combine

struct FavoriteProductsView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @StateObject private var viewModel = FavoriteProductsViewModel()
    @Environment(\.presentationMode) var presentationMode
    var market: SimpleMarket = SimpleMarket(id: 1, name: "어쩌고가게", operatingTime: ["this":"tothis"], location: "여기", phoneNumber: "010")
    
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
                Text("관심 상품")
                    .font(.system(size: 18, weight: .medium))
                    .padding(.trailing, 50)
                Spacer()
            }
            .padding(0)
            
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
                    ForEach(viewModel.products) { product in
                        NavigationLink(destination: ProductDetailView(product: product, market: market)) {
                            ProductRow(product: product)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}


//#Preview {
//    FavoriteProductsView()
//}
