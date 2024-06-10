//
//  FavoriteMarketsView.swift
//  Bloom
//
//  Created by 조다은 on 6/9/24.
//

import SwiftUI
import Combine

struct FavoriteMarketsView: View {
    @StateObject private var viewModel = FavoriteMarketsViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .padding()
                }
                Spacer()
                Text("관심 마켓")
                    .font(.system(size: 18, weight: .medium))
                Spacer()
                Spacer() // 오른쪽 여백을 위한 Spacer
            }
            .padding()
            
            List(viewModel.markets) { market in
                VStack(alignment: .leading) {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(10)
                        .padding(.bottom, 8)
                    
                    HStack {
                        Text(market.name)
                            .font(.pretendardSemiBold(size: 18))
                        Spacer()
                        Text(market.status)
                            .padding(4)
                            .font(.caption)
                            .foregroundStyle(market.status == "운영중" ? Color.operating : Color.preparing)
                            .frame(width: 51, height: 22)
                            .background(market.status == "운영중" ? Color(hex: "E4F7FF"): Color(hex: "FFE1E1"))
                            .cornerRadius(99)
                    }
                    
                    HStack {
                        Text(market.location)
                            .font(.subheadline)
                            .foregroundStyle(Color.gray2)
                        
                        Spacer()
                        
                        Text(market.price)
                            .font(.subheadline)
                            .foregroundStyle(Color.gray3)
                    }
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            // 관심 목록 추가/삭제 액션
                        }) {
                            Image(systemName: "heart")
                                .padding()
                                .background(.white)
                                .cornerRadius(8)
                        }
                    }
                }
                .padding(.vertical, 8)
            }
            .listStyle(PlainListStyle())
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}


#Preview {
    FavoriteMarketsView()
}
