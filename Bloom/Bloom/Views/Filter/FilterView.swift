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
    @ObservedObject var slider = CustomSlider(start: 0, end: 100000)
    @Environment(\.presentationMode) var presentationMode
    @Binding var hideTabBar: Bool
    
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
                        hideTabBar = false
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundStyle(Color(hex: "000001"))
                    }
                }
                .padding()
                
                Text("카테고리")
                    .font(.pretendardSemiBold(size: 16))
                    .padding(.horizontal)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 10) {
                    ForEach(categories, id: \.self) { category in
                        CategoryFilterButton(title: category, isSelected: selectedCategory == category) {
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
                    HStack {
                        SliderView(slider: slider)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    HStack {
                        HStack {
                            CustomTextField(value: $slider.lowHandle.currentValue, placeholder: "최소 가격", foregroundColor: UIColor(Color.pointOrange), font: UIFont(name: "Pretendard-Bold", size: 15)!)
                            Text(" 원")
                                .foregroundColor(Color.pointOrange)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.pointOrange))
                        .keyboardType(.numberPad)
                        
                        Text("~")
                            .padding(.horizontal, 1)
                        
                        HStack {
                            CustomTextField(value: $slider.highHandle.currentValue, placeholder: "최대 가격", foregroundColor: UIColor(Color.gray4), font: UIFont(name: "Pretendard-Bold", size: 15)!)
                            Text(" 원")
                                .foregroundColor(Color.gray4)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray4))
                        .keyboardType(.numberPad)
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                }
                
                Text("색상")
                    .font(.pretendardSemiBold(size: 16))
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 10) {
                    ForEach(colors, id: \.0) { color in
                        ColorFilterButton(colorName: color.0, color: color.1, isSelected: selectedColors.contains(color.0)) {
                            toggleColor(color.0)
                        }
                        .frame(height: 50)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    // 검색하기 액션
                }) {
                    Text("검색하기")
                        .font(.pretendardSemiBold(size: 18))
                        .foregroundStyle(.white)
                        .frame(width: 353, height: 61)
                        .background(Color.pointOrange)
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                }
                
            }
        }
        .onAppear {
            hideTabBar = true
        }
        .onDisappear {
            hideTabBar = false
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    
    private func toggleColor(_ color: String) {
        if selectedColors.contains(color) {
            selectedColors.remove(color)
        } else {
            selectedColors.insert(color)
        }
    }
}

extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter
    }
}

#Preview {
    FilterView(hideTabBar: .constant(false))
}
