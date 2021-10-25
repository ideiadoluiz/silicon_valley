//
//  Image.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

import UIKit

fileprivate class ImageMemoization {
    private static var savedImages = [Int: Data]()
    
    static func getImageData(_ urlString: String) -> Data? {
        return savedImages[urlString.hashValue]
    }
    
    static func setImageData(_ urlString: String, _ data: Data) {
        savedImages[urlString.hashValue] = data
    }
}

/*
 * This didn't work very well but I took way longer than I should here.
 */
extension UIImage {
    
    internal static func loadFromString(_ urlString: String, _ callback: @escaping (UIImage) -> Void) async {
        if let data = ImageMemoization.getImageData(urlString) {
            callback(UIImage(data: data as Data)!)
        } else {
            let url = URL.init(string: urlString)
            let data = NSData(contentsOf: url!)
            let unwrappedData = data! as Data
            ImageMemoization.setImageData(urlString, unwrappedData)
            callback(UIImage(data: unwrappedData)!)
        }
    }
}
