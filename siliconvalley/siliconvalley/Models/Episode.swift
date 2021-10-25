//
//  Episode.swift
//  siliconvalley
//
//  Created by Luiz Peres on 2021-10-25.
//

internal class Episode: Parseable {
    
    private(set) var id: String?
    private(set) var name: String?
    private(set) var image: Image
    private(set) var season: Int?
    private(set) var number: Int?
    private(set) var airDate: String?
    private(set) var runtime: Int?
    private(set) var summary: String?
    
    init(id: String?, name: String?, image: Image,
         season: Int?, number: Int?, airDate: String?,
         runtime: Int?, summary: String?) {
        self.id = id
        self.name = name
        self.image = image
        self.season = season
        self.number = number
        self.airDate = airDate
        self.runtime = runtime
        self.summary = summary
    }
    
    static func parse(dict: [String : AnyObject]?) -> Parseable {
        let id = dict?["id"] as? String
        let name = dict?["name"] as? String
        let image = Image.parse(dict: dict?["image"] as? [String: AnyObject]) as! Image
        let season = dict?["season"] as? Int
        let number = dict?["number"] as? Int
        let airDate = dict?["airdate"] as? String
        let runtime = dict?["runtime"] as? Int
        let summary = dict?["summary"] as? String
        return Episode(id: id, name: name, image: image,
                       season: season, number: number, airDate: airDate,
                       runtime: runtime, summary: summary)
    }
}
