//
//  ProductDetailView.swift
//  Bloom
//
//  Created by 조다은 on 6/6/24.
//

import SwiftUI

struct ProductDetail: Identifiable {
    let id: UUID
    let name: String
    let price: String
    let imageName: String
    let description: String
    let packagingMethod: String
    let storageMethod: String
    let caution: String
    let marketName: String
    let marketStatus: String
    let marketLocation: String
}

class ProductDetailViewModel: ObservableObject {
    @Published var product: ProductDetail
    
    init() {
        self.product = ProductDetail(
            id: UUID(),
            name: "고백공격 장미꽃다발",
            price: "19,900원",
            imageName: "flower1",
            description: "꽃에 대한 설명을 바바바박 적어요.\n이 부분에는 글자수 제한이 있으면 좋을 것 같습니다!\n다들 힘내서 프로젝트 잘 마무리하세요~~",
            packagingMethod: "강남역 바로 옆 초 역세권 짱짱 꽃집이랍니다.이 부분에는 글자수 제한이 있으면 좋을 것 같습니다!",
            storageMethod: "강남역 바로 옆 초 역세권 짱짱 꽃집이랍니다. 이 부분에는 글자수 제한이 있으면 좋을 것 같습니다!",
            caution: "강남역 바로 옆 초 역세권 짱짱 꽃집이랍니다. 이 부분에는 글자수 제한이 있으면 좋을 것 같습니다!",
            marketName: "가든 플라워 라우라",
            marketStatus: "운영중",
            marketLocation: "강남구 서초동"
        )
    }
}

struct ProductDetailView: View {
    @StateObject private var viewModel = ProductDetailViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ZStack(alignment: .bottomTrailing) {
                        Image(viewModel.product.imageName)
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
                                .foregroundStyle(Color.pointOrange)
                                .clipShape(Circle())
                        }
                        .padding(10)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(viewModel.product.name)
                            .font(.pretendardMedium(size: 22))
                        
                        Text(viewModel.product.price)
                            .font(.pretendardBold(size: 20))
                        
                        Text(viewModel.product.description)
                            .padding(.horizontal, 10)
                            .frame(width: 353, height: 103)
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
                        Text("포장방식")
                            .font(.pretendardSemiBold(size: 16))
                        
                        Text(viewModel.product.packagingMethod)
                            .font(.pretendardRegular(size: 14))
                            .foregroundStyle(Color.gray3)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 5)
                    
                    Rectangle()
                        .frame(height: 6)
                        .foregroundStyle(Color.gray6)
                        .background(Color.gray6)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("보관방식")
                            .font(.pretendardSemiBold(size: 16))
                        
                        Text(viewModel.product.storageMethod)
                            .font(.pretendardRegular(size: 14))
                            .foregroundStyle(Color.gray3)
                    }
                    .padding(.horizontal, 20)
                    
                    Rectangle()
                        .frame(height: 6)
                        .foregroundStyle(Color.gray6)
                        .background(Color.gray6)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("유의사항")
                            .font(.pretendardSemiBold(size: 16))
                        
                        Text(viewModel.product.caution)
                            .font(.pretendardRegular(size: 14))
                            .foregroundStyle(Color.gray3)
                    }
                    .padding(.horizontal, 20)
                }
            }
            
            Divider()
                .background(Color.gray)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(viewModel.product.marketName)
                            .font(.headline)
                            .foregroundStyle(Color.primary)
                        
                        HStack {
                            Text(viewModel.product.marketStatus)
                                .font(.caption)
                                .foregroundStyle(viewModel.product.marketStatus == "운영중" ? Color.blue : Color.red)
                                .padding(4)
                                .background(viewModel.product.marketStatus == "운영중" ? Color.blue.opacity(0.2) : Color.red.opacity(0.2))
                                .cornerRadius(5)
                            
                            Image(systemName: "location")
                                .foregroundStyle(Color.gray)
                            
                            Text(viewModel.product.marketLocation)
                                .font(.body)
                                .foregroundStyle(Color.gray)
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
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(leading: Button(action: {
            // 뒤로가기 액션
        }) {
            Image(systemName: "chevron.left")
                .foregroundStyle(Color.black)
        })
    }
}

#Preview {
    ProductDetailView()
}
