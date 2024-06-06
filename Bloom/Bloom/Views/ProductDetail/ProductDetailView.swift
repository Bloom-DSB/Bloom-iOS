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
            description: "꽃에 대한 설명을 바바바박 적어요. 이 부분에는 글자수 제한이 있으면 좋을 것 같습니다! 다들 힘내서 프로젝트 잘 마무리하세요~~",
            packagingMethod: "강남역 바로 옆 초 역세권 짱짱 꽃집이랍니다. 이 부분에는 글자수 제한이 있으면 좋을 것 같습니다!",
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
                    ZStack(alignment: .topTrailing) {
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
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        }
                        .padding(10)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(viewModel.product.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(viewModel.product.price)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text(viewModel.product.description)
                            .font(.body)
                            .padding()
                            .background(Color.yellow.opacity(0.3))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                        .background(Color.gray)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("포장방식")
                            .font(.headline)
                        
                        Text(viewModel.product.packagingMethod)
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                        .background(Color.gray)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("보관방식")
                            .font(.headline)
                        
                        Text(viewModel.product.storageMethod)
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                        .background(Color.gray)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("유의사항")
                            .font(.headline)
                        
                        Text(viewModel.product.caution)
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                }
            }
            
            Divider()
                .background(Color.gray)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(viewModel.product.marketName)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Text(viewModel.product.marketStatus)
                        .font(.caption)
                        .foregroundColor(viewModel.product.marketStatus == "운영중" ? .blue : .red)
                        .padding(4)
                        .background(viewModel.product.marketStatus == "운영중" ? Color.blue.opacity(0.2) : Color.red.opacity(0.2))
                        .cornerRadius(5)
                }
                
                HStack {
                    Image(systemName: "location")
                        .foregroundColor(.gray)
                    
                    Text(viewModel.product.marketLocation)
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Button(action: {
                        // 전화하기 액션
                    }) {
                        Text("전화하기")
                            .font(.body)
                            .fontWeight(.bold)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
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
                .foregroundColor(.black)
        })
    }
}

struct ContentView_Previews3: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}

#Preview {
    ProductDetailView()
}
