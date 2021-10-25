//
//  Localizable.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-24.
//

import Foundation

extension String {
    
    internal static func localized(forKey key: String) -> String {
        return Bundle.main.localizedString(forKey: key, value: nil, table: "Default")
    }
    
}
