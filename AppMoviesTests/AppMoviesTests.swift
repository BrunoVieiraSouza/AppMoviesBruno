//
//  AppMoviesTests.swift
//  AppMoviesTests
//
//  Created by Bruno Vieira Souza on 17/01/22.
//

import XCTest
@testable import AppMovies

class AppMoviesTests: XCTestCase {
    
    var sut: HomeViewController!

    override func setUpWithError() throws {
        sut = HomeViewController()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSectionTableView() {
        let total = sut.numberSectionsTableView()
        XCTAssertEqual(total, 3)
    }
}
