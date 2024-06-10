//
//  CategoryFilterButton.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import SwiftUI

struct CategoryFilterButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity)
                .font(.pretendardSemiBold(size: 14))
                .fontWeight(isSelected ? .bold : .regular)
                .foregroundStyle(isSelected ? Color.pointOrange : Color.gray3)
                .padding()
                .background(RoundedRectangle(cornerRadius: 8)
                    .stroke(isSelected ? Color.pointOrange : Color.gray4, lineWidth: 1.3))
        }
        .padding(.horizontal, 1)
        .padding(.vertical, 2)
    }
}
