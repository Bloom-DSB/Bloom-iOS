//
//  MarketProductsView.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import SwiftUI

//struct MarketProductsView: View {
//    @StateObject private var viewModel = MarketProductsViewModel()
//    @Environment(\.presentationMode) var presentationMode
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Button(action: {
//                    presentationMode.wrappedValue.dismiss()
//                }) {
//                    Image(systemName: "chevron.left")
//                        .resizable()
//                        .foregroundStyle(.black)
//                        .frame(width: 9, height: 18)
//                }
//                
//                Spacer()
//                
//                Text("판매 상품")
//                    .font(.pretendardMedium(size: 18))
//                
//                Spacer()
//            }
//            .padding(.vertical, 15)
//            
//            ScrollView {
//                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
//                    ForEach(viewModel.products) { product in
//                        VStack(alignment: .leading, spacing: 3) {
//                            Image(product.imageName)
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 107, height: 134)
//                                .clipped()
//                                .cornerRadius(8)
//                                .padding(.bottom, 1)
//                            
//                            Text(product.name)
//                                .font(.pretendardMedium(size: 14))
//                                .foregroundStyle(Color.gray2)
//                                .lineLimit(1)
//                            
//                            Text(product.price)
//                                .font(.pretendardBold(size: 15))
//                        }
//                    }
//                }
//            }
//        }
//        .padding(.horizontal, 20)
//        .navigationBarTitle("")
//        .navigationBarHidden(true)
//    }
//}
//
//#Preview {
//    MarketProductsView()
//}
