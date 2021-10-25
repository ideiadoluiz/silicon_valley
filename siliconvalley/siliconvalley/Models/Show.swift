//
//  Show.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

internal class Show: Parseable {
    
    private(set) var id: String?
    private(set) var name: String?
    private(set) var summary: String?
    private(set) var image: Image
    private(set) var episodes: [Episode]
    
    init(id: String?, name: String?, summary: String?,
         image: Image, episodes: [Episode]) {
        self.id = id
        self.name = name
        self.summary = summary
        self.image = image
        self.episodes = episodes
    }
    
    static func parse(dict: [String : AnyObject]?) -> Parseable {
        let id = dict?["id"] as? String
        let name = dict?["name"] as? String
        let summary = dict?["summary"] as? String
        let image = Image.parse(dict: dict?["image"] as? [String: AnyObject]) as! Image
        let embedded =
            ((dict?["_embedded"] as? [String: AnyObject])?["episodes"] as? [[String: AnyObject]]) ??
            [[String: AnyObject]]()
        let episodes = embedded.map { Episode.parse(dict: $0) as! Episode }
        return Show(id: id, name: name, summary: summary, image: image, episodes: episodes)
    }
}
