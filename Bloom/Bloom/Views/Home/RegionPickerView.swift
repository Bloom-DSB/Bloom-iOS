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
                }
                .padding()
            }

            HStack {
                Picker("도시", selection: $selectedCity) {
                    ForEach(regions.map { $0.city }, id: \.self) { city in
                        Text(city).tag(city)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .onChange(of: selectedCity) { newValue in
                    if let firstDistrict = regions.first(where: { $0.city == newValue })?.districts.first {
                        selectedDistrict = firstDistrict
                    }
                }

                Picker("구", selection: $selectedDistrict) {
                    ForEach(regions.first(where: { $0.city == selectedCity })?.districts ?? [], id: \.self) { district in
                        Text(district).tag(district)
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            .frame(height: 200)
        }
        .background(Color.white)
        .cornerRadius(20)
//        .shadow(radius: 10)
    }
}
