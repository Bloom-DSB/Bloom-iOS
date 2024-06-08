//
//  SearchResultsView.swift
//  Bloom
//
//  Created by 조다은 on 6/8/24.
//

import SwiftUI

struct Product: Identifiable {
    let id: UUID
    let name: String
    let price: String
    let imageName: String
    let status: String
}

class SearchResultsViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var searchText: String = ""
    @Published var showOnlyOperating: Bool = false
    
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

struct SearchResultsView: View {
    @StateObject private var viewModel = SearchResultsViewModel()
    
    var filteredProducts: [Product] {
        viewModel.showOnlyOperating ? viewModel.products.filter { $0.status == "운영중" } : viewModel.products
    }
    
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
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                        .frame(width: 15, height: 15)
                    
                    TextField("검색어를 입력하세요", text: $viewModel.searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                        .foregroundColor(Colors.gray3)
                        .padding(.horizontal, 4)
                        .font(.pretendardRegular(size: 15))
                }
                .padding(.horizontal, 15)
                .frame(width: 265, height: 44)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                
                Button(action: {
                    // 필터 모달 추가
                }) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 44, height: 44)
                        .background(.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .inset(by: 0.5)
                                .stroke(Colors.pointOrange)
                        )
                        .overlay(
                            Image("filter-icon")
                        )
                }
                .padding(.leading, 5)
            }
            
            HStack {
                Text("상품 \(filteredProducts.count)개")
                    .font(.pretendardMedium(size: 14))
                    .foregroundColor(Colors.gray2)
                
                Spacer()
                
                HStack(spacing: 0) { // 간격을 없애기 위해 spacing을 0으로 설정
                    Text("운영 중인 가게만 보기")
                        .font(.pretendardMedium(size: 14))
                        .foregroundColor(viewModel.showOnlyOperating ? Colors.operating : Colors.gray3)
                        .padding(.trailing, 10)
                    
                    Toggle("", isOn: $viewModel.showOnlyOperating)
                        .labelsHidden() // 라벨을 숨겨서 텍스트와 토글 사이의 간격을 제거
                        .toggleStyle(SwitchToggleStyle(tint: Colors.operating))
                }
            }
            .padding(.top, 10)
            
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
                    ForEach(filteredProducts) { product in
                        VStack(alignment: .leading, spacing: 3) {
                            Image(product.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 107, height: 134)
                                .clipped()
                                .cornerRadius(8)
                                .padding(.bottom, 1)
                            
                            Text(product.status)
                                .font(.pretendardSemiBold(size: 11))
                                .foregroundColor(product.status == "운영중" ? Colors.operating : Colors.preparing)
                            
                            Text(product.name)
                                .font(.pretendardMedium(size: 14))
                                .foregroundStyle(Colors.gray2)
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
    SearchResultsView()
}