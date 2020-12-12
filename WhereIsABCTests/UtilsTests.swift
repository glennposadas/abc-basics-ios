//
//  UtilsTests.swift
//  WhereIsABCTests
//
//  Created by Glenn Posadas on 12/13/20.
//

@testable import WhereIsABC
import XCTest

class UtilsTests: XCTestCase {

    func testIsALetterRegEx() {
        XCTAssertTrue("a".isALetter)
        XCTAssertTrue("A".isALetter)
        XCTAssertTrue("Z".isALetter)
        XCTAssertFalse("1".isALetter)
        XCTAssertFalse("?".isALetter)
    }
}
