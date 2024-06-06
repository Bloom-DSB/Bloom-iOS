//
//  MarketDetailView.swift
//  Bloom
//
//  Created by 조다은 on 6/6/24.
//

import SwiftUI

struct Product: Identifiable {
    let id: UUID
    let name: String
    let price: String
    let imageName: String
}

struct MarketDetail: Identifiable {
    let id: UUID
    let name: String
    let status: String
    let description: String
    let products: [Product]
    let location: String
    let mapImageName: String
}

class MarketDetailViewModel: ObservableObject {
    @Published var marketDetail: MarketDetail
    
    init() {
        self.marketDetail = MarketDetail(
            id: UUID(),
            name: "가든 플라워 라우라",
            status: "운영중",
            description: "강남역 바로 옆 초역세권 짱짱 꽃집이랍니다. 이 부분에는 글자수 제한이 있으면 좋을 것 같습니다!",
            products: [
                Product(id: UUID(), name: "고백공격 장미꽃", price: "19,900원", imageName: "flower1"),
                Product(id: UUID(), name: "세상에서 제일 예쁜 꽃", price: "15,000원", imageName: "flower2"),
                Product(id: UUID(), name: "고백공격 장미꽃", price: "19,900원", imageName: "flower1"),
                Product(id: UUID(), name: "세상에서 제일 예쁜 꽃", price: "15,000원", imageName: "flower2"),
                Product(id: UUID(), name: "로맨틱 튤립", price: "12,000원", imageName: "flower3"),
                Product(id: UUID(), name: "봄의 정원", price: "25,000원", imageName: "flower4")
            ],
            location: "강남구 서초동",
            mapImageName: "mapImage"
        )
    }
}

struct MarketDetailView: View {
    @StateObject private var viewModel = MarketDetailViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ZStack(alignment: .bottomTrailing) {
                    Image(viewModel.marketDetail.products.first?.imageName ?? "defaultImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                    
                    Button(action: {
                        // 관심 토글 액션
                    }) {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding()
                            .foregroundStyle(Colors.pointOrange)
                            .clipShape(Circle())
                    }
                    .padding(10)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(viewModel.marketDetail.status)
                            .font(.pretendardMedium(size: 14))
                            .frame(width: 60, height: 24)
                            .foregroundColor(viewModel.marketDetail.status == "운영중" ? Colors.operating : Colors.preparing)
                            .background(viewModel.marketDetail.status == "운영중" ? Color(hex: "E4F7FF"): Color(hex: "FFE1E1"))
                            .cornerRadius(99)
                        
                        Spacer()
                    }
                    
                    Text(viewModel.marketDetail.name)
                        .font(.pretendardBold(size: 24))
                        .bold()
                    
                    Text(viewModel.marketDetail.description)
                        .font(.pretendardRegular(size: 14))
                        .foregroundColor(Colors.gray3)
                        .padding(.vertical, 5)
                    
                    HStack(alignment: .center, spacing: 25, content: {
                        Button(action: {
                            // 전화 액션
                        }) {
                            VStack {
                                Image(systemName: "phone")
                                    .font(.title2)
                                    .foregroundStyle(Colors.pointOrange)
                                Text("전화")
                                    .font(.pretendardMedium(size: 11))
                                    .foregroundStyle(Colors.pointOrange)
                                    .padding(.top, 1)
                            }
                        }
                        Rectangle()
                            .frame(width: 1, height: 34)
                            .foregroundColor(Colors.pointOrange)
                        
                        Button(action: {
                            // SNS 액션
                        }) {
                            VStack {
                                Image(systemName: "camera")
                                    .font(.title2)
                                    .foregroundStyle(Colors.pointOrange)
                                Text("SNS")
                                    .font(.pretendardMedium(size: 11))
                                    .foregroundStyle(Colors.pointOrange)
                                    .padding(.top, 1)
                            }
                        }
                        Rectangle()
                            .frame(width: 1, height: 34)
                            .foregroundColor(Colors.pointOrange)
                        
                        Button(action: {
                            // 운영시간 액션
                        }) {
                            VStack {
                                Image(systemName: "clock")
                                    .font(.title2)
                                    .foregroundStyle(Colors.pointOrange)
                                Text("운영시간")
                                    .font(.pretendardMedium(size: 11))
                                    .foregroundStyle(Colors.pointOrange)
                                    .padding(.top, 1)
                            }
                        }
                        Rectangle()
                            .frame(width: 1, height: 34)
                            .foregroundColor(Colors.pointOrange)
                        
                        Button(action: {
                            // 공유 액션
                        }) {
                            VStack {
                                Image(systemName: "square.and.arrow.up")
                                    .font(.title2)
                                    .foregroundStyle(Colors.pointOrange)
                                Text("공유")
                                    .font(.pretendardMedium(size: 11))
                                    .foregroundStyle(Colors.pointOrange)
                                    .padding(.top, 1)
                            }
                        }
                    })
                    .frame(width: 353, height: 75)
                    .background(Color.yellow.opacity(0.3))
                    .cornerRadius(8)
                }
                .padding(.horizontal, 20)
                .padding(.top)
                .padding(.bottom, 10)
                
                Rectangle()
                    .frame(height: 6)
                    .foregroundStyle(Colors.gray6)
                    .background(Colors.gray6)
                
                HStack {
                    Text("판매 상품")
                        .font(.pretendardSemiBold(size: 16))

                    Spacer()
                    
                    HStack(spacing: 5) {
                        Text("전체보기")
                            .font(.pretendardMedium(size: 14))
                            .foregroundStyle(Colors.gray4)
                        Image(systemName: "chevron.right")
                            .foregroundStyle(Colors.gray4)
                            .frame(height: 5)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
                    ForEach(viewModel.marketDetail.products) { product in
                        VStack(alignment: .leading) {
                            Image(product.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 100)
                                .clipped()
                                .cornerRadius(8)
                            
                            Text(product.name)
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            Text(product.price)
                                .font(.body)
                                .bold()
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                Rectangle()
                    .frame(height: 6)
                    .foregroundStyle(Colors.gray6)
                    .background(Colors.gray6)
                
                HStack {
                    Text("위치")
                        .font(.pretendardSemiBold(size: 16))
                    
                    Spacer()
                    
                    HStack(spacing: 5) {
                        Image(systemName: "location")
                            .foregroundStyle(Colors.gray2)
                        Text(viewModel.marketDetail.location)
                            .font(.pretendardRegular(size: 15))
                            .foregroundStyle(Colors.gray2)
                    }
                        
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                VStack(alignment: .leading) {
                    
                    Image(viewModel.marketDetail.mapImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .clipped()
                    
                    HStack(alignment: .center, spacing: 7) {
                        Image(systemName: "exclamationmark.circle")
                            .foregroundColor(.gray)
                        Text("강남역 바로 옆 초 역세권 짱짱 꽃집이랍니다.")
                            .font(.pretendardRegular(size: 12))
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 5)
                }
                .padding(.horizontal)
                .padding(.top)
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(leading: Button(action: {
            // 뒤로가기 액션
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
        })
    }
}

struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        MarketDetailView()
    }
}

#Preview {
    MarketDetailView()
}
