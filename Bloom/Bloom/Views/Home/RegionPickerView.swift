//
//  RegionPickerView.swift
//  Bloom
//
//  Created by 조다은 on 6/11/24.
//

import SwiftUI

struct RegionPickerView: View {
    @Binding var selectedCity: String
    @Binding var selectedDistrict: String
    @Binding var isPresented: Bool
    var onComplete: () -> Void
    
    private var cities: [String] {
        regions.map { $0.city }
    }
    
    private var districts: [String] {
        regions.first(where: { $0.city == selectedCity })?.districts ?? []
    }
    
    var body: some View {
        VStack {
            HStack {
                Button("취소") {
                    isPresented = false
                }
                .padding()
                
                Spacer()
                
                Button("완료") {
                    isPresented = false
                    onComplete()
                    print("도시 선택: \(selectedCity)")

                }
                .padding()
            }
            
            HStack {
                Picker("도시", selection: $selectedCity) {
                    ForEach(cities, id: \.self) { city in
                        Text(city).tag(city)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .onChange(of: selectedCity) { newValue in
                    if let firstDistrict = regions.first(where: { $0.city == newValue })?.districts.first {
                        selectedDistrict = firstDistrict
                    }
                    print("도시 선택: \(selectedCity)")
                }
                
                Picker("구", selection: $selectedDistrict) {
                    ForEach(districts, id: \.self) { district in
                        Text(district).tag(district)
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            .frame(height: 200)
        }
        .background(Color.white)
        .cornerRadius(20)
        .onAppear {
            if !cities.contains(selectedCity) {
                selectedCity = cities.first ?? ""
            }
            if !districts.contains(selectedDistrict) {
                selectedDistrict = districts.first ?? ""
            }
        }
    }
}

#Preview {
    RegionPickerView(
        selectedCity: .constant("서울특별시"),
        selectedDistrict: .constant("강남구"),
        isPresented: .constant(true),
        onComplete: {}
    )
}
