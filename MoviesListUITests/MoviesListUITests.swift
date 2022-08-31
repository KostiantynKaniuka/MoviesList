//
//  MoviesListUITests.swift
//  MoviesListUITests
//
//  Created by Kostiantyn Kaniuka on 31.08.2022.
//

import XCTest

@testable import MoviesList

class MoviesListUITests: XCTestCase {
    var app: XCUIApplication!
    lazy var yearTextFied = app.textFields.element(boundBy: 1)
    
    override func setUpWithError() throws {
        self.app = XCUIApplication()
        self.app.launch()
    }
    
    func testOnlyNumbers() throws {
        // Given
        let input = "2283fas3"
        let expectedOutput = "22833"
        //When
        yearTextFied.tap()
        yearTextFied.typeText(input)
        //Then
        XCTAssertEqual((yearTextFied.value as? String), expectedOutput)
    }
}
