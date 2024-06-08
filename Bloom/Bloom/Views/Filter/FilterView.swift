//
//  FilterView.swift
//  Bloom
//
//  Created by 조다은 on 6/8/24.
//

import SwiftUI

struct FilterView: View {
    @State private var selectedCategory: String? = nil
    @State private var selectedColors: Set<String> = []
    @State private var minPrice: Double = -10000
    @State private var maxPrice: Double = 100000
    
    private let categories = ["꽃다발", "꽃바구니", "드라이플라워", "조화"]
    private let colors = [
        ("화이트", Color.white),
        ("레드", Color(hex: "E85959")),
        ("블루", Color(hex: "#7DCDFB")),
        ("옐로우", Color(hex: "#F9D75E")),
        ("핑크", Color(hex: "#FFAEC6")),
        ("퍼플", Color(hex: "#AE83D8")),
        ("오렌지", Color(hex: "#FFA930")),
        ("기타", Color.black)
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Spacer()
                    
                    Text("필터")
                        .font(.pretendardMedium(size: 18))
                    
                    Spacer()
                    
                    Button(action: {
                        // 닫기 액션
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(Color(hex: "000001"))
                    }
                }
                .padding()
                
                Text("카테고리")
                    .font(.pretendardSemiBold(size: 16))
                    .padding(.horizontal)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 10) {
                    ForEach(categories, id: \.self) { category in
                        FilterButton(title: category, isSelected: selectedCategory == category) {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal)
                
                Text("가격")
                    .font(.pretendardSemiBold(size: 16))
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                VStack(alignment: .leading) {
                    RangeSlider(minValue: $minPrice, maxValue: $maxPrice, range: 0...100000)
                        .padding(.horizontal)
                    
                    HStack {
                        Text("₩\(Int(minPrice), specifier: "%d") 원")
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                        
                        Spacer()
                        
                        Text("₩\(Int(maxPrice), specifier: "%d") 원")
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                }
                
                Text("색상")
                    .font(.pretendardSemiBold(size: 16))
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 10) {
                    ForEach(colors, id: \.0) { color in
                        ColorButton(colorName: color.0, color: color.1, isSelected: selectedColors.contains(color.0)) {
                            toggleColor(color.0)
                        }
                        .frame(height: 50) // 버튼의 크기 조절
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    // 검색하기 액션
                }) {
                    Text("검색하기")
                        .font(.pretendardSemiBold(size: 18))
                        .foregroundColor(.white)
                        .frame(width: 353, height: 61)
                        .background(Color.orange)
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                }
                
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
    
    private func toggleColor(_ color: String) {
        if selectedColors.contains(color) {
            selectedColors.remove(color)
        } else {
            selectedColors.insert(color)
        }
    }
}

struct FilterButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity)
                .font(.pretendardSemiBold(size: 14))
                .fontWeight(isSelected ? .bold : .regular)
                .foregroundColor(isSelected ? Colors.pointOrange : Colors.gray3)
                .padding()
                .background(RoundedRectangle(cornerRadius: 8)
                    .stroke(isSelected ? Colors.pointOrange : Colors.gray4, lineWidth: 1.3))
        }
        .padding(.horizontal, 1)
        .padding(.vertical, 2)
    }
}

struct ColorButton: View {
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
                        .foregroundColor(Colors.gray3)
                    Spacer()
                }
            }
            .padding(12)
            .frame(maxWidth: .infinity, minHeight: 50) // 버튼의 크기 조절
            .background(RoundedRectangle(cornerRadius: 8)
                .stroke(isSelected ? Colors.pointOrange : Colors.gray4, lineWidth: 1.3))
        }
    }
}


#Preview {
    FilterView()
}
