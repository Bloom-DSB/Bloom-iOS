//
//  ProductRow.swift
//  Bloom
//
//  Created by 조다은 on 6/12/24.
//

import SwiftUI

struct ProductRow: View {
    var product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            AsyncImage(url: URL(string: product.images.first ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 107, height: 134)
                    .clipped()
                    .cornerRadius(8)
                    .padding(.bottom, 1)
            } placeholder: {
                Color.gray
                    .frame(width: 107, height: 134)
                    .cornerRadius(8)
            }
            
            Text(product.name)
                .font(.pretendardMedium(size: 14))
                .foregroundStyle(Color.gray2)
                .lineLimit(1)
            
            Text("\(product.price)원")
                .font(.pretendardBold(size: 15))
        }
    }
}

#Preview {
    ProductRow(product: Product(
        marketId: 1,
        productId: 1,
        name: "사과",
        category: "과일",
        price: 1000,
        images: [
            "https://strbloom.blob.core.windows.net/undefined/flower_c.jpg",
            "https://strbloom.blob.core.windows.net/undefined/flower_b.jpg"
        ],
        descriptionImage: "https://strbloom.blob.core.windows.net/undefined/flower_c.jpg",
        share: true,
        interestCount: 100,
        caution: "알러지 주의"
    ))
}
