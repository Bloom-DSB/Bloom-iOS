//
//  MarketRow.swift
//  Bloom
//
//  Created by 조다은 on 6/12/24.
//

import SwiftUI

struct MarketRow: View {
    @ObservedObject var viewModel: HomeViewModel
    var market: Market
    @State private var isFavorite = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                HStack(spacing: 0) {
                    // 왼쪽 큰 이미지
                    if let firstImageURL = market.simpleProducts.first?.images.first, let url = URL(string: firstImageURL) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.57, height: 160)
                        .clipped()
                    } else {
                        Color.gray
                            .frame(width: UIScreen.main.bounds.width * 0.57, height: 160)
                    }
                    
                    VStack(spacing: 0) {
                        // 오른쪽 상단 작은 이미지
                        if market.simpleProducts.count > 1, let secondImageURL = market.simpleProducts[1].images.first, let url = URL(string: secondImageURL) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: UIScreen.main.bounds.width * 0.33, height: 80)
                            .clipped()
                        } else {
                            Color.gray
                                .frame(width: UIScreen.main.bounds.width * 0.33, height: 80)
                        }
                        
                        // 오른쪽 하단 작은 이미지
                        if market.simpleProducts.count > 2, let secondImageURL = market.simpleProducts[2].images.first, let url = URL(string: secondImageURL) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: UIScreen.main.bounds.width * 0.33, height: 80)
                            .clipped()
                        } else {
                            Color.gray
                                .frame(width: UIScreen.main.bounds.width * 0.33, height: 80)
                        }
                    }
                }
                .padding(.bottom, 2)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.clear, lineWidth: 0)
                )
                
                Button(action: {
                    isFavorite.toggle()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .padding(10)
                        .background(.white)
                        .foregroundStyle(isFavorite ? Color.pointOrange : Color.gray5)
                        .clipShape(Circle())
                }
                .padding(10)
                .contentShape(Rectangle())
                .onTapGesture {
                    isFavorite.toggle()
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            HStack {
                Text("\(market.name)")
                    .font(.pretendardSemiBold(size: 18))
                
                Spacer()
                
                Text(market.isOperation ? "운영중" : "휴무중")
                    .padding(4)
                    .font(.pretendardRegular(size: 12))
                    .frame(width: 60, height: 22)
                    .foregroundStyle(market.isOperation ? Color.operating : Color.preparing)
                    .background(market.isOperation ? Color(hex: "E4F7FF"): Color(hex: "FFE1E1"))
                    .cornerRadius(99)
            }
            
            HStack {
                HStack {
                    Image("location-icon")
                    
                    Text("\(market.location)")
                        .font(.pretendardRegular(size: 15))
                        .foregroundStyle(Color.gray2)
                }
                
                Spacer()
                
                Text("\(market.summary)")
                    .font(.pretendardRegular(size: 14))
                    .foregroundStyle(Color.gray3)
                    .lineLimit(1)
                    .multilineTextAlignment(.trailing)
            }
        }
        .padding(.vertical, 3)
        .listRowSeparator(.hidden)
        .background(Color.white)
        .cornerRadius(10)
    }
}
