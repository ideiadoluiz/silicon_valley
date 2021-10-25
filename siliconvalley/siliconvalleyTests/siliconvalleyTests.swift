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
    
}
