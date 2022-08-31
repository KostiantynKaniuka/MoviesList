//
//  MoviesListTests.swift
//  MoviesListTests
//
//  Created by Kostiantyn Kaniuka on 31.08.2022.
//

import XCTest
@testable import MoviesList

class MoviesListTests: XCTestCase {

    func testIfWorads_Are_Merged() throws {
        //Given
        let inputDate = 23
        let inputName = "Matrix"
        let emptyArray:[String] = []
        var sut = ListCreationLogic(title: inputName, year: inputDate, generatedModelList: emptyArray)
        //When
        sut.generationOfList()
        let expectedOutput = ["Matrix 23"]
        //Then
        XCTAssertTrue(sut.generatedModelList == expectedOutput)
    }

    func testIfDuplicateValidation() throws {
        let Input = ["Matrix 23"]
        let secondInput = ["Matrix 23", "Matrix 23"]
        XCTAssertTrue(Input == secondInput.removingDuplicates())
    }

}
