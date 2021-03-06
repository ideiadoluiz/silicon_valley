//
//  Localizable.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-24.
//

import UIKit

extension String {
    
    internal static func localized(forKey key: String) -> String {
        return Bundle.main.localizedString(forKey: key, value: nil, table: "Default")
    }
    
    internal var cleanParagraph: String {
        return self.replacingOccurrences(of: "<p>", with: "")
            .replacingOccurrences(of: "</p>", with: "")
    }
    
}
