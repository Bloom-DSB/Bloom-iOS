//
//  FavoriteProductsView.swift
//  Bloom
//
//  Created by 조다은 on 6/9/24.
//

import SwiftUI
import Combine

class FavoriteProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    init() {
        loadFavoriteProducts()
    }
    
    func loadFavoriteProducts() {
        let dummyProducts = [
            Product(id: UUID(), name: "고백공격 장미꽃", price: "19,900원", imageName: "flower1", status: "운영중"),
            Product(id: UUID(), name: "세상에서 제일 예쁜 꽃", price: "15,000원", imageName: "flower2", status: "준비중"),
            Product(id: UUID(), name: "고백공격 장미꽃", price: "19,900원", imageName: "flower1", status: "운영중"),
            Product(id: UUID(), name: "세상에서 제일 예쁜 꽃", price: "15,000원", imageName: "flower2", status: "준비중"),
            Product(id: UUID(), name: "로맨틱 튤립", price: "12,000원", imageName: "flower3", status: "운영중"),
            Product(id: UUID(), name: "봄의 정원", price: "25,000원", imageName: "flower4", status: "운영중")
        ]
        self.products = dummyProducts
    }
}


struct FavoriteProductsView: View {
    @StateObject private var viewModel = FavoriteProductsViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // 뒤로가기 액션
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                .padding(.trailing, 7)
                
                Text("관심 상품")
                    .font(.system(size: 18, weight: .medium))
                
                Spacer()
            }
            .padding()
            
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
                    ForEach(viewModel.products) { product in
                        VStack(alignment: .leading, spacing: 3) {
                            Image(product.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 107, height: 134)
                                .clipped()
                                .cornerRadius(8)
                                .padding(.bottom, 1)
                            
                            Text(product.status)
                                .font(.system(size: 11, weight: .semibold))
                                .foregroundColor(product.status == "운영중" ? Color.blue : Color.red)
                            
                            Text(product.name)
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(Color.gray)
                                .lineLimit(1)
                            
                            Text(product.price)
                                .font(.system(size: 15, weight: .bold))
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


#Preview {
    FavoriteProductsView()
}
