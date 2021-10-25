//
//  ContentLoader.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-24.
//

import Foundation

internal struct ContentLoader<T> {

    @available(*, unavailable) private init() {}

    internal static func GET() -> T? {
        let mainBundle = Bundle.main
        let jsonPath = mainBundle.path(forResource: "data", ofType: ".json")
        guard
            let jsonData = NSData(contentsOfFile: jsonPath!),
            let json = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .allowFragments)
        else {
            return nil
        }
        
        return json as? T
    }

}
