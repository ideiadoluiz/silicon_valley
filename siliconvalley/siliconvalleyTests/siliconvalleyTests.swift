//
//  siliconvalleyTests.swift
//  siliconvalleyTests
//
//  Created by Luiz Peres on 2021-10-24.
//

import XCTest
@testable import siliconvalley

/*
 * Note: I created only one file and I didn't take a lot of time
 * to create the tests as I was trying to work with the time contraints (3h)
 */
class HelpersTest: XCTestCase {
    
    func testContentLoader() throws {
        let loadedContent = ContentLoader<[String: Any]>.GET()
        let notLoadedContent = ContentLoader<[Any]>.GET()
        
        XCTAssertNotNil(loadedContent)
        XCTAssertNil(notLoadedContent)
    }
    
    func testLocalizableStrings() throws {
        let titleStr = "Title"
        XCTAssertEqual(titleStr, String.localized(forKey: "title"))
        
        let nonExisting = String.localized(forKey: "random_str")
        XCTAssertEqual(nonExisting, "random_str")
    }
    
    func testParseable() throws {
        class TestParseable: Parseable {
            private(set) var id: String?
            private(set) var name: String?
            
            init(id: String?, name: String?) {
                self.id = id
                self.name = name
            }
            
            static func parse(dict: [String : AnyObject]?) -> Parseable {
                let id = dict?["id"] as? String
                let name = dict?["name"] as? String
                return TestParseable(id: id, name: name)
            }
        }
        
        let jsonExample = [
            "id" : "1234",
            "name": "Test",
            "wow": 1
        ] as [String: AnyObject]
        
        let parsed = jsonExample.parse(p: TestParseable.self) as! TestParseable
        XCTAssertEqual(parsed.id, jsonExample["id"] as? String)
        XCTAssertEqual(parsed.name, jsonExample["name"] as? String)
    }
}
