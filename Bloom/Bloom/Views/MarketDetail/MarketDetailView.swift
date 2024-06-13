//
//  MarketDetailView.swift
//  Bloom
//
//  Created by 조다은 on 6/6/24.
//

import SwiftUI

struct MarketDetailView: View {
    @Binding var hideTabBar: Bool
    @Environment(\.presentationMode) var presentationMode

    let market: Market

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                ZStack(alignment: .topLeading) {
                    if let firstImageURL = market.simpleProducts.first?.images.first {
                        
//                        AsyncImage(url: URL(string: market.simpleProducts[0].images[0])) { image in
//                            image
                        CachedAsyncImage(url: firstImageURL)
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width, height: 320)
                                .clipped()
//                        } placeholder: {
//                            Color.gray
//                                .frame(width: UIScreen.main.bounds.width, height: 320)
//                        }
                    }

                    HStack {
                        Button(action: {
                            hideTabBar = false
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
                    Text(market.name)
                        .font(.pretendardBold(size: 24))
                        .bold()

                    Text(market.summary)
                        .font(.pretendardRegular(size: 14))
                        .foregroundStyle(Color.gray3)
                        .padding(.vertical, 5)

                    HStack(alignment: .center, spacing: 25, content: {
                        Button(action: {
                            // 전화 액션
                        }) {
                            VStack {
                                Image(systemName: "phone")
                                    .font(.title2)
                                    .foregroundStyle(Color.pointOrange)
                                Text("전화")
                                    .font(.pretendardMedium(size: 11))
                                    .foregroundStyle(Color.pointOrange)
                                    .padding(.top, 1)
                            }
                        }
                        Rectangle()
                            .frame(width: 1, height: 34)
                            .foregroundStyle(Color.pointOrange)

                        Button(action: {
                            // SNS 액션
                        }) {
                            VStack {
                                Image(systemName: "camera")
                                    .font(.title2)
                                    .foregroundStyle(Color.pointOrange)
                                Text("SNS")
                                    .font(.pretendardMedium(size: 11))
                                    .foregroundStyle(Color.pointOrange)
                                    .padding(.top, 1)
                            }
                        }
                        Rectangle()
                            .frame(width: 1, height: 34)
                            .foregroundStyle(Color.pointOrange)

                        Button(action: {
                            // 운영시간 액션
                        }) {
                            VStack {
                                Image(systemName: "clock")
                                    .font(.title2)
                                    .foregroundStyle(Color.pointOrange)
                                Text("운영시간")
                                    .font(.pretendardMedium(size: 11))
                                    .foregroundStyle(Color.pointOrange)
                                    .padding(.top, 1)
                            }
                        }
                        Rectangle()
                            .frame(width: 1, height: 34)
                            .foregroundStyle(Color.pointOrange)

                        Button(action: {
                            // 공유 액션
                        }) {
                            VStack {
                                Image(systemName: "square.and.arrow.up")
                                    .font(.title2)
                                    .foregroundStyle(Color.pointOrange)
                                Text("공유")
                                    .font(.pretendardMedium(size: 11))
                                    .foregroundStyle(Color.pointOrange)
                                    .padding(.top, 1)
                            }
                        }
                    })
                    .frame(width: 353, height: 75)
                    .background(Color.baseYellow)
                    .cornerRadius(8)
                }
                .padding(.horizontal, 20)
                .padding(.top)
                .padding(.bottom, 10)

                Rectangle()
                    .frame(height: 6)
                    .foregroundStyle(Color.gray6)
                    .background(Color.gray6)

                HStack {
                    Text("판매 상품")
                        .font(.pretendardSemiBold(size: 16))

                    Spacer()

                    NavigationLink(destination: MarketProductsView(simpleProducts: market.simpleProducts, market: SimpleMarket(id: market.id, name: market.name, operatingTime: market.operatingTime, location: market.location, phoneNumber: market.phoneNumber))) {
                        HStack(spacing: 5) {
                            Text("전체보기")
                                .font(.pretendardMedium(size: 14))
                                .foregroundStyle(Color.gray4)
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color.gray4)
                                .frame(height: 5)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)

                LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
                    ForEach(market.simpleProducts) { product in
                        NavigationLink(destination: 
                                        ProductDetailView(
                                            product: product,
                                            market:
                                                SimpleMarket(id: market.id, name: market.name, operatingTime: market.operatingTime, location: market.location, phoneNumber: market.phoneNumber)
                                        )
                        ) {
                            VStack(alignment: .leading) {
                                if let firstImageURL = product.images.first {
//                                    AsyncImage(url: url) { image in
//                                        image
                                    CachedAsyncImage(url: firstImageURL)
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 130)
                                            .clipped()
                                            .cornerRadius(8)
//                                    } placeholder: {
//                                        Color.gray
//                                            .frame(width: 100, height: 130)
//                                    }
                                }

                                Text(product.name)
                                    .font(.pretendardMedium(size: 14))
                                    .foregroundStyle(Color.gray2)
                                    .lineLimit(1)
                                    .padding(.trailing, 5)

                                Text("\(product.price)원")
                                    .font(.pretendardBold(size: 15))
                                    .foregroundStyle(Color.black)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)

                Rectangle()
                    .frame(height: 6)
                    .foregroundStyle(Color.gray6)
                    .background(Color.gray6)

                HStack {
                    Text("위치")
                        .font(.pretendardSemiBold(size: 16))

                    Spacer()

                    HStack(spacing: 5) {
                        Image("location-icon")
                            .foregroundStyle(Color.gray2)
                        Text(market.location)
                            .font(.pretendardRegular(size: 15))
                            .foregroundStyle(Color.gray2)
                    }

                }
                .padding(.horizontal)
                .padding(.top, 10)

                VStack(alignment: .leading) {
                    Image(market.simpleProducts.first?.images.first ?? "defaultImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .clipped()

                    HStack(alignment: .center, spacing: 7) {
                        Image(systemName: "exclamationmark.circle")
                            .foregroundStyle(Color.gray3)
                        Text(market.addressDetail)
                            .font(.pretendardRegular(size: 12))
                            .foregroundStyle(Color.gray3)
                        Spacer()
                    }
                    .padding(.top, 5)
                }
                .padding(.horizontal)
                .padding(.top)
            }
            .onAppear {
                hideTabBar = true
            }
            .onDisappear {
                hideTabBar = false
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}
