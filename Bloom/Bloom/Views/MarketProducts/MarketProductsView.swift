//
//  MarketProductsView.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import SwiftUI

struct MarketProductsView: View {
//    @Environment(\.presentationMode) var presentationMode
    let simpleProducts: [SimpleProduct]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
//                    presentationMode.wrappedValue.dismiss()
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
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(simpleProducts) { product in
                        VStack(alignment: .leading, spacing: 3) {
                            AsyncImage(url: URL(string: product.images.first ?? "")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 107, height: 134)
                                    .clipped()
                                    .cornerRadius(8)
                                    .padding(.bottom, 1)
                            } placeholder: {
                                Color.gray
                            }
                            
                            Text(product.name)
                                .font(.pretendardMedium(size: 14))
                                .foregroundStyle(Color.gray2)
                                .lineLimit(1)
                            
                            Text("\(product.price)원")
                                .font(.pretendardBold(size: 15))
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
    MarketProductsView(simpleProducts: [
        SimpleProduct(id: 1, name: "사과", price: 1000, images: ["https://strbloom.blob.core.windows.net/undefined/flower_c.jpg"]),
        SimpleProduct(id: 2, name: "바나나", price: 2000, images: ["https://strbloom.blob.core.windows.net/undefined/flower_b.jpg"])
    ])
}
