//
//  FavoriteProductsView.swift
//  Bloom
//
//  Created by 조다은 on 6/9/24.
//

import SwiftUI
import Combine

//struct FavoriteProductsView: View {
//    @StateObject private var viewModel = FavoriteProductsViewModel()
//    @Environment(\.presentationMode) var presentationMode
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Button(action: {
//                    presentationMode.wrappedValue.dismiss()
//                }) {
//                    Image(systemName: "chevron.left")
//                        .foregroundStyle(.black)
//                        .padding()
//                }
//                Spacer()
//                Text("관심 상품")
//                    .font(.system(size: 18, weight: .medium))
//                Spacer()
//                Spacer() // 오른쪽 여백을 위한 Spacer
//            }
//            .padding()
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
//                            Text(product.status)
//                                .font(.pretendardSemiBold(size: 11))
//                                .foregroundStyle(product.status == "운영중" ? Color.operating : Color.preparing)
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
//                .padding(.horizontal, 20)
//            }
//        }
//        .navigationBarTitle("")
//        .navigationBarHidden(true)
//    }
//}
//
//
//#Preview {
//    FavoriteProductsView()
//}
