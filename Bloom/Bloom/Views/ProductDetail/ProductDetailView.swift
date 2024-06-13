//
//  ProductDetailView.swift
//  Bloom
//
//  Created by 조다은 on 6/6/24.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let product: SimpleProduct
    let market: SimpleMarket

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ZStack(alignment: .topLeading) {
                        AsyncImage(url: URL(string: product.images.first ?? "")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 393, height: 300)
                                .clipped()
                        } placeholder: {
                            Color.gray
                                .frame(width: 393, height: 300)
                                .clipped()
                        }

                        HStack {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundStyle(.white)
                                    .padding()
                                    .clipShape(Circle())
                                    .padding(10)
                            }

                            Spacer()
                        }

                        VStack {
                            Spacer()

                            HStack {
                                Spacer()

                                Button(action: {
                                    // 관심 토글 액션
                                }) {
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundStyle(Color.pointOrange)
                                        .padding()
                                        .background(Color.white)
                                        .clipShape(Circle())
                                        .padding(15)
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(product.name)
                            .font(.pretendardMedium(size: 22))

                        Text("\(product.price)원")
                            .font(.pretendardBold(size: 20))

                        Text(product.caution)
                            .padding(.horizontal, 20)
                            .frame(width: 353, height: 63, alignment: .leading)
                            .font(.pretendardRegular(size: 14))
                            .foregroundStyle(Color.gray2)
                            .background(Color.baseYellow)
                            .cornerRadius(8)
                            .lineSpacing(3)
                    }
                    .padding(.horizontal, 20)

                    Rectangle()
                        .frame(height: 6)
                        .foregroundStyle(Color.gray6)
                        .background(Color.gray6)

                    VStack(alignment: .leading, spacing: 8) {
                        AsyncImage(url: URL(string: product.descriptionImage)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 393, height: .infinity)
                                .clipped()
                        } placeholder: {
                            Color.gray
                                .frame(width: 393, height: 500)
                                .clipped()
                        }
                    }
                    .padding(.top, 5)
                }
            }

            Divider()
                .background(Color.gray)

            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(market.name)
                            .font(.pretendardSemiBold(size: 18))
                            .foregroundStyle(Color.primary)

                        HStack {
                            Text("운영 상태")
                                .font(.caption)
                                .foregroundStyle(Color.blue)
                                .padding(4)
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(5)

                            HStack(spacing: 0) {
                                Image("location-icon")
                                    .foregroundStyle(Color.gray)
                                    .padding(.trailing, 5)
                                
                                Text(market.location)
                                    .font(.pretendardRegular(size: 15))
                                    .foregroundStyle(Color.gray2)
                            }
                        }
                    }

                    Spacer()

                    Button(action: {
                        // 전화하기 액션
                    }) {
                        Text("전화하기")
                            .font(.body)
                            .fontWeight(.bold)
                            .padding()
                            .background(Color.orange)
                            .foregroundStyle(Color.white)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
            .background(Color(UIColor.systemBackground))
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

//#Preview {
//    ProductDetailView(product: SimpleProduct(id: 8770, name: "남자친구를 위한 꽃 한송이", category: "꽃 한송이", color: "블루", price: 5000, descriptionImage: "blueDes.png", share: "https://example.com/share7", interestCount: 115, caution: "파란색이 좋아하는 남자친구에게 선물하세요.", images: ["https://strbloom.blob.core.windows.net/product/product_one_blueflower1.png"]))
//}
