//
//  MarketProductsView.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import SwiftUI

struct MarketProductsView: View {
    @Environment(\.presentationMode) var presentationMode
    let simpleProducts: [SimpleProduct]
    let market: SimpleMarket
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

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
            .padding(.vertical, 20)
            .padding(.leading, 30)
            .padding(.trailing, 45)

            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(simpleProducts) { product in
                        NavigationLink(destination: ProductDetailView(product: product, market: market)) {
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
                                        .frame(width: 107, height: 134)
                                        .clipped()
                                }
                                
                                Text(product.name)
                                    .font(.pretendardMedium(size: 14))
                                    .foregroundStyle(Color.gray2)
                                    .lineLimit(1)
                                
                                Text("\(product.price)원")
                                    .font(.pretendardBold(size: 15))
                                    .foregroundStyle(Color.black)
                            }
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
//
//#Preview {
//    MarketProductsView(simpleProducts: [
//        SimpleProduct(id: 8770, name: "남자친구를 위한 꽃 한송이", category: "꽃 한송이", color: "블루", price: 5000, descriptionImage: "blueDes.png", share: "https://example.com/share7", interestCount: 115, caution: "파란색이 좋아하는 남자친구에게 선물하세요.", images: ["https://strbloom.blob.core.windows.net/product/product_one_blueflower1.png"]),
//        SimpleProduct(id: 8769, name: "순백의 꽃다발", category: "꽃다발", color: "화이트", price: 90000, descriptionImage: "whiteDes.png", share: "https://example.com/share6", interestCount: 130, caution: "신부님과 잘어울릴 수 있는 꽃다발입니다.", images: ["https://strbloom.blob.core.windows.net/product/product_bouquet_white1.png"])
//    ])
//}
