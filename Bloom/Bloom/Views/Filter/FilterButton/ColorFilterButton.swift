//
//  ColorFilterButton.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import SwiftUI

struct ColorFilterButton: View {
    let colorName: String
    let color: Color
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                HStack {
                    Circle()
                        .fill(color)
                        .frame(width: 24, height: 24)
                    
                    Text(colorName)
                        .font(.pretendardMedium(size: 14))
                        .foregroundStyle(Color.gray3)
                    Spacer()
                }
            }
            .padding(12)
            .frame(maxWidth: .infinity, minHeight: 50) // 버튼의 크기 조절
            .background(RoundedRectangle(cornerRadius: 8)
                .stroke(isSelected ? Color.pointOrange : Color.gray4, lineWidth: 1.3))
        }
    }
}
