//
//  FilterView.swift
//  Bloom
//
//  Created by 조다은 on 6/8/24.
//

import SwiftUI

struct FilterView: View {
    @ObservedObject var filterViewModel: FilterViewModel
    @Environment(\.presentationMode) var presentationMode
    @Binding var hideTabBar: Bool
    @Binding var showFilterView: Bool
    @Binding var navigateToSearchResults: Bool
    
    @State private var isLowHandleActive = false
    @State private var isHighHandleActive = false
    
    private let categories = ["꽃다발", "꽃바구니", "꽃 한송이", "기타"]
    private let colors = [
        ("화이트", Color.white),
        ("레드", Color(hex: "E85959")),
        ("블루", Color(hex: "7DCDFB")),
        ("옐로우", Color(hex: "F9D75E")),
        ("핑크", Color(hex: "FFAEC6")),
        ("퍼플", Color(hex: "AE83D8")),
        ("오렌지", Color(hex: "FFA930")),
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
                        withAnimation {
                            showFilterView = false
                        }
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
                        CategoryFilterButton(title: category, isSelected: filterViewModel.selectedCategory == category) {
                            filterViewModel.selectedCategory = category
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
                        SliderView(slider: CustomSlider(start: Double(filterViewModel.minPrice), end: Double(filterViewModel.maxPrice)))
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    HStack {
                        HStack {
                            CustomTextField(
                                value: $filterViewModel.minPrice,
                                placeholder: "최소 가격",
                                foregroundColor: isLowHandleActive ? UIColor(Color.pointOrange) : UIColor(Color.gray4),
                                font: UIFont(name: "Pretendard-Medium", size: 15)!,
                                isActive: $isLowHandleActive
                            )
                            Text(" 원")
                                .font(.pretendardMedium(size: 14))
                                .foregroundColor(isLowHandleActive ? Color.pointOrange : Color.black)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(isLowHandleActive ? Color.pointOrange : Color.gray4))                        .keyboardType(.numberPad)
                        
                        Text("~")
                            .padding(.horizontal, 1)
                        
                        HStack {
                            CustomTextField(
                                value: $filterViewModel.maxPrice,
                                placeholder: "최대 가격",
                                foregroundColor: isHighHandleActive ? UIColor(Color.pointOrange) : UIColor(Color.gray4),
                                font: UIFont(name: "Pretendard-Medium", size: 14)!,
                                isActive: $isHighHandleActive
                            )
                            Text(" 원")
                                .font(.pretendardMedium(size: 14))
                                .foregroundColor(isHighHandleActive ? Color.pointOrange : Color.black)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(isHighHandleActive ? Color.pointOrange : Color.gray4))
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
                        ColorFilterButton(colorName: color.0, color: color.1, isSelected: filterViewModel.selectedColors.contains(color.0)) {
                            toggleColor(color.0)
                        }
                        .frame(height: 50)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    navigateToSearchResults = true
                    hideTabBar = false
                    withAnimation {
                        showFilterView = false
                    }
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
        if filterViewModel.selectedColors.contains(color) {
            filterViewModel.selectedColors.remove(color)
        } else {
            filterViewModel.selectedColors.insert(color)
        }
    }
}

#Preview {
    FilterView(filterViewModel: FilterViewModel(), hideTabBar: .constant(false), showFilterView: .constant(false), navigateToSearchResults: .constant(false))
}
