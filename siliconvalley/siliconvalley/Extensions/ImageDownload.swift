//
//  Image.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

import UIKit

extension UIImage {

    internal static func loadFromString(_ urlString: String) -> UIImage {
        let url = URL.init(string: urlString)
        let data = NSData(contentsOf: url!)
        return UIImage(data: data! as Data)!
    }

}
