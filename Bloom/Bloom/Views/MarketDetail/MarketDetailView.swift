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
                    AsyncImage(url: URL(string: market.simpleProducts[0].images[0])) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: 320)
                            .clipped()
                    } placeholder: {
                        Color.gray
                            .frame(width: UIScreen.main.bounds.width, height: 320)
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
                        NavigationLink(destination: ProductDetailView(product: product, market: SimpleMarket(id: market.id, name: market.name, operatingTime: market.operatingTime, location: market.location, phoneNumber: market.phoneNumber))) {
                            VStack(alignment: .leading) {
                                AsyncImage(url: URL(string: product.images[0])) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 130)
                                        .clipped()
                                        .cornerRadius(8)
                                } placeholder: {
                                    Color.gray
                                        .frame(width: 100, height: 130)
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

//#Preview {
//    MarketDetailView(hideTabBar: .constant(false), market: Market(
//        id: 1,
//        name: "서울마켓",
//        summary: "서울에서 가장 인기 있는 마켓",
//        addressDetail: "서울특별시 강남구",
//        location: "강남구",
//        phoneNumber: "010-1234-5678",
//        sns: "http://instagram.com/seoulmarket",
//        simpleProducts: [
//            SimpleProduct(id: 8770, name: "남자친구를 위한 꽃 한송이", category: "꽃 한송이", color: "블루", price: 5000, descriptionImage: "blueDes.png", share: "https://example.com/share7", interestCount: 115, caution: "파란색이 좋아하는 남자친구에게 선물하세요.", images: ["https://strbloom.blob.core.windows.net/product/product_one_blueflower1.png"]),
//            SimpleProduct(id: 8769, name: "순백의 꽃다발", category: "꽃다발", color: "화이트", price: 90000, descriptionImage: "whiteDes.png", share: "https://example.com/share6", interestCount: 130, caution: "신부님과 잘어울릴 수 있는 꽃다발입니다.", images: ["https://strbloom.blob.core.windows.net/product/product_bouquet_white1.png"]),
//            SimpleProduct(id: 8768, name: "행복한 아침 해바라기", category: "꽃 한송이", color: "옐로우", price: 8000, descriptionImage: "sunflowerDes.png", share: "https://example.com/share5", interestCount: 110, caution: "해바라기는 햇빛을 좋아합니다.", images: ["https://strbloom.blob.core.windows.net/product/product_one_sunflower1.png"]),
//            SimpleProduct(id: 8767, name: "밝은 당신과 닮은 장미바구니", category: "꽃바구니", color: "옐로우", price: 80000, descriptionImage: "yellowDes.png", share: "https://example.com/share4", interestCount: 90, caution: "노란색이 어울린다면 딱인 상품입니다.", images: ["https://strbloom.blob.core.windows.net/product/product_basket_yellowrose1.png"]),
//            SimpleProduct(id: 8766, name: "감사해요 꽃바구니", category: "꽃바구니", color: "옐로우", price: 35000, descriptionImage: "yellowDes.png", share: "https://example.com/share3", interestCount: 100, caution: "네덜란드산 튤립을 즐길 수 있습니다. 굿굿", images: ["https://strbloom.blob.core.windows.net/product/product_basket_tulip1.jpeg"]),
//            SimpleProduct(id: 8765, name: "사랑을 전할 꽃다발", category: "꽃다발", color: "레드", price: 50000, descriptionImage: "redroseDes.png", share: "https://example.com/share2", interestCount: 120, caution: "꽃이 무거우니 조심하세요!", images: ["https://strbloom.blob.core.windows.net/product/product_bouquet_rose1.jpeg"])
//        ],
//        interestCount: 100,
//        operatingTime: [
//            "Sunday": "Closed",
//            "Saturday": "10:00 - 14:00",
//            "Friday": "09:00 - 18:00",
//            "Thursday": "09:00 - 18:00",
//            "Wednesday": "09:00 - 18:00",
//            "Tuesday": "09:00 - 18:00",
//            "Monday": "09:00 - 18:00"
//        ],
//        latitude: 37.5665,
//        longitude: 126.9784
//    ))
//}
