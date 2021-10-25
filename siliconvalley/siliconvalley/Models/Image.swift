//
//  Image.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

internal class Image: Parseable {
    private(set) var medium: String?
    private(set) var original: String?
    
    init(medium: String?, original: String?) {
        self.medium = medium
        self.original = original
    }
    
    static func parse(dict: [String : AnyObject]?) -> Parseable {
        let medium = dict?["medium"] as? String
        let original = dict?["original"] as? String
        return Image(medium: medium, original: original)
    }
}
