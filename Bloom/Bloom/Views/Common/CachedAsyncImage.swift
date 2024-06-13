//
//  CachedAsyncImage.swift
//  Bloom
//
//  Created by 조다은 on 6/14/24.
//

import Foundation
import SwiftUI

struct CachedAsyncImage: View {
    @State private var uiImage: UIImage?
    let url: String

    var body: some View {
        Group {
            if let uiImage = uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                Color.gray // Placeholder 색상
                    .onAppear {
                        loadImage()
                    }
            }
        }
    }

    private func loadImage() {
        if let cachedImage = ImageCache.shared.image(forKey: url) {
            self.uiImage = cachedImage
        } else {
            guard let imageURL = URL(string: url) else { return }
            URLSession.shared.dataTask(with: imageURL) { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    ImageCache.shared.setImage(image, forKey: url)
                    DispatchQueue.main.async {
                        self.uiImage = image
                    }
                }
            }.resume()
        }
    }
}
