//
//  CustomRangeSlider.swift
//  Bloom
//
//  Created by 조다은 on 6/8/24.
//

import SwiftUI

struct RangeSlider: View {
    @Binding var minValue: Double
    @Binding var maxValue: Double
    let range: ClosedRange<Double>
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Slider background line
                Rectangle()
                    .frame(height: 4)
                    .foregroundColor(.gray)
                    .cornerRadius(2)
                
                // Active range line
                Rectangle()
                    .frame(width: CGFloat((maxValue - minValue) / (range.upperBound - range.lowerBound)) * geometry.size.width, height: 4)
                    .foregroundColor(.orange)
                    .cornerRadius(2)
                    .offset(x: CGFloat((minValue - range.lowerBound) / (range.upperBound - range.lowerBound)) * geometry.size.width)
                
                // Min handle
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.orange)
                    .offset(x: max(0, CGFloat((minValue - range.lowerBound) / (range.upperBound - range.lowerBound)) * geometry.size.width - 10))
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let newValue = min(max(Double(value.location.x / geometry.size.width) * (range.upperBound - range.lowerBound) + range.lowerBound, range.lowerBound), maxValue)
                                minValue = newValue
                            }
                    )
                
                // Max handle
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.orange)
                    .offset(x: max(0, CGFloat((maxValue - range.lowerBound) / (range.upperBound - range.lowerBound)) * geometry.size.width - 10))
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let newValue = max(min(Double(value.location.x / geometry.size.width) * (range.upperBound - range.lowerBound) + range.lowerBound, range.upperBound), minValue)
                                maxValue = newValue
                            }
                    )
                    .zIndex(1)
            }
        }
        .frame(height: 20)
    }
}

struct RangeSlider_Previews: PreviewProvider {
    @State static var minValue: Double = 0
    @State static var maxValue: Double = 100000
    
    static var previews: some View {
        RangeSlider(minValue: $minValue, maxValue: $maxValue, range: 0...100000)
            .padding()
    }
}

//#Preview {
//    CustomRangeSlider()
//}
