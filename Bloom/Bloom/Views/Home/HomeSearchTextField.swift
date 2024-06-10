//
//  HomeSearchTextField.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import SwiftUI

struct HomeSearchTextField: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.black)
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text("소중한 사람에게 장미를🌹")
                        .foregroundStyle(Color.gray3)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 4)
                        .font(.pretendardRegular(size: 15))
                }
                TextField("", text: $text)
                    .padding(.vertical, 8)
            }
        }
        .padding(.horizontal, 15)
        .frame(width: 299, height: 44)
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}
