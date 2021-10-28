//
//  ImageCache.swift
//  MockImageCacheProject
//
//  Created by Daniel Brannon on 10/26/21.
//

import Foundation
import UIKit


class ImageCache {
    
    var nsCache: NSCache<NSString, UIImage> = NSCache()
    
    func read(imageStr: String) -> UIImage? {
        let nsString = imageStr as NSString
        return nsCache.object(forKey: nsString)
    }
    
    func write(imageStr: String, image: UIImage) {
        let nsString = imageStr as NSString
        nsCache.setObject(image, forKey: nsString)
    }
}

