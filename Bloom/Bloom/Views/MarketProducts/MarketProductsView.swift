//
//  MarketProductsView.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import SwiftUI

class MarketProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    init() {
        loadProducts()
    }
    
    func loadProducts() {
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

struct MarketProductsView: View {
    @StateObject private var viewModel = MarketProductsViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .foregroundStyle(.black)
                        .frame(width: 9, height: 18)
                }
                
                Spacer()
                
                Text("판매 상품")
                    .font(.pretendardMedium(size: 18))
                
                Spacer()
            }
            .padding(.vertical, 15)
            
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
                            
                            Text(product.name)
                                .font(.pretendardMedium(size: 14))
                                .foregroundStyle(Color.gray2)
                                .lineLimit(1)
                            
                            Text(product.price)
                                .font(.pretendardBold(size: 15))
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 20)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}


#Preview {
    MarketProductsView()
}
