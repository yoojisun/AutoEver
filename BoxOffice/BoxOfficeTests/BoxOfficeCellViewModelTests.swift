//
//  BoxOfficeCellViewModelTests.swift
//  BoxOfficeTests
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/25.
//

import XCTest
@testable import BoxOffice

final class BoxOfficeCellViewModelTests: XCTestCase {
    var sut: BoxOfficeCellViewModel!
    var mockResponse = MockResponse()
    
    func setup(boxOffice: WeeklyBoxOfficeList) {
        let boxOfficeDTO = boxOffice.convertToDTO()
        sut = BoxOfficeCellViewModel(weeklyBoxOfficeListDTO: boxOfficeDTO)
    }

    func test_정보모두표시() {
        let boxOffice = mockResponse.mockWeeklyBoxOfficeList(rank: "3", movieNm: "해리포터", openDt: "20220202")
        setup(boxOffice: boxOffice)
        XCTAssertEqual(sut.rank, "3")
        XCTAssertEqual(sut.movieNm, "해리포터")
        XCTAssertEqual(sut.openDt, "20220202")
    }
}
