//
//  MoviesListTests.swift
//  MoviesListTests
//
//  Created by Kostiantyn Kaniuka on 31.08.2022.
//

import XCTest
@testable import MoviesList

class MoviesListTests: XCTestCase {

    func testDuplicateValidation() throws {
        var store = Set<Movies>()
        let sut = Movies(name: "Matrix", releaseDate: 2002)
        let sut2 = Movies(name: "Matrix", releaseDate: 2003)
        store.insert(sut)
        let oldStore = store
        store.insert(sut2)
        let newSore = store
        XCTAssertTrue(newSore == oldStore)
    }
    
    func testCapitalizationCheck() throws {
        var store = Set<Movies>()
        let sut = Movies(name: "Matrix", releaseDate: 2002)
        let sut2 = Movies(name: "matrix", releaseDate: 2003)
        store.insert(sut)
        let oldStore = store
        store.insert(sut2)
        let newSore = store
        XCTAssertFalse(newSore == oldStore)
    }
}
