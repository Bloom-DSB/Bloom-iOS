import SwiftUI

struct SearchResultsView: View {
    @StateObject private var viewModel = SearchResultsViewModel()
    let query: String
    let filterParams: [String: String]
    @Environment(\.presentationMode) var presentationMode

    var filteredProducts: [Product] {
        viewModel.showOnlyOperating ? viewModel.products.filter { $0.category == "꽃다발" } : viewModel.products
    }

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.black)
                }
                .padding(.trailing, 7)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(Color.black)
                        .frame(width: 15, height: 15)
                    
                    TextField("검색어를 입력하세요", text: $viewModel.searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                        .foregroundStyle(Color.gray3)
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
                        .foregroundStyle(Color.clear)
                        .frame(width: 44, height: 44)
                        .background(.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .inset(by: 0.5)
                                .stroke(Color.pointOrange)
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
                    .foregroundStyle(Color.gray2)
                
                Spacer()
                
                HStack(spacing: 0) { // 간격을 없애기 위해 spacing을 0으로 설정
                    Text("운영 중인 가게만 보기")
                        .font(.pretendardMedium(size: 14))
                        .foregroundStyle(viewModel.showOnlyOperating ? Color.operating : Color.gray3)
                        .padding(.trailing, 10)
                    
                    Toggle("", isOn: $viewModel.showOnlyOperating)
                        .labelsHidden()
                        .toggleStyle(SwitchToggleStyle(tint: Color.operating))
                }
            }
            .padding(.top, 10)
            
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
                    ForEach(filteredProducts) { product in
                        ProductRow(product: product)
                    }
                }
            }
        }
        .padding(.horizontal, 20)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .onAppear {
            viewModel.searchProducts(query: query, filterParams: filterParams)
        }
    }
}

#Preview {
    SearchResultsView(query: "꽃", filterParams: ["category": "꽃다발"])
}
