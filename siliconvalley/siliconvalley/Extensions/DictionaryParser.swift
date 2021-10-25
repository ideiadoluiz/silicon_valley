//
//  DictionaryParser.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

protocol Parseable {
    static func parse(dict: [String: AnyObject]?) -> Parseable
}

extension Dictionary where Key == String, Value == AnyObject {
    
    internal func parse(p: Parseable.Type) -> Parseable {
        return p.parse(dict: self)
    }

}
