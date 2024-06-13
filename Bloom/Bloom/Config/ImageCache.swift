//
//  ImageCache.swift
//  Bloom
//
//  Created by 조다은 on 6/14/24.
//

import Foundation
import UIKit

class ImageCache {
    static let shared = ImageCache()
    private let cache = NSCache<NSString, UIImage>()

    func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: NSString(string: key))
    }

    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: NSString(string: key))
    }
}
