//
//  MoviesListUITests.swift
//  MoviesListUITests
//
//  Created by Константин Канюка on 31.08.2022.
//

import XCTest

@testable import MoviesList

class MoviesListUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        self.app = XCUIApplication()
        self.app.launch()
    }

    override func tearDownWithError() throws {
    }
}
