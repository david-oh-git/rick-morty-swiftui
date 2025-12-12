//
//  InfoTest.swift
//  rick and morty swiftui
//
//  Created by shinji on 9/23/24.
//
import XCTest
@testable import rick_and_morty_swiftui

class InfoTest : XCTestCase {
    
    var info: Info!
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        info = nil
    }
    
    func verifyAttributes() {
        // Arrange
        let expectedCount = 5
        let expectedPages = 15
        let expectedExpectedNext = "next_"
        let expectedPrev: String? = nil
        let expectedNext = "hee_next"
        
        let result: Info = Info(
            count: expectedCount,
            pages: expectedPages,
            next: expectedNext,
            prev: expectedPrev
        )
        
        // Act
        XCTAssertEqual(expectedCount, result.count)
    }
}

