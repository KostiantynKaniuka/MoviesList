//
//  MoviesListTests.swift
//  MoviesListTests
//
//  Created by Kostiantyn Kaniuka on 31.08.2022.
//
import OrderedCollections
import XCTest
@testable import MoviesList

class MoviesListTests: XCTestCase {
    
    func testDuplicateValidation() throws {
        var store = OrderedSet<Movies>()
        let sut = Movies(name: "Matrix", releaseDate: 2002)
        let sut2 = Movies(name: "Matrix", releaseDate: 2003)
        store.insert(sut, at: 0)
        let oldStore = store
        store.insert(sut2, at: 0)
        let newSore = store
        XCTAssertTrue(newSore == oldStore)
    }
    
    func testCapitalizationCheck() throws {
        var store = OrderedSet<Movies>()
        let sut = Movies(name: "Matrix", releaseDate: 2002)
        let sut2 = Movies(name: "matrix", releaseDate: 2003)
        store.insert(sut, at: 0)
        let oldStore = store
        store.insert(sut2, at: 0)
        let newSore = store
        XCTAssertTrue(newSore == oldStore)
    }
}
