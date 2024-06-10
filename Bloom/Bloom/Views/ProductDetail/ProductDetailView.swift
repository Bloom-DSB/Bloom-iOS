//
//  ProductDetailView.swift
//  Bloom
//
//  Created by 조다은 on 6/6/24.
//

import SwiftUI

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
