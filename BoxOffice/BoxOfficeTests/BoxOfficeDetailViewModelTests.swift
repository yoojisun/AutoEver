//
//  BoxOfficeDetailViewModelTests.swift
//  BoxOfficeTests
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/25.
//

import XCTest
@testable import BoxOffice

final class BoxOfficeDetailViewModelTests: XCTestCase {
    var sut: BoxOfficeDetailViewModel!
    var mockResponse = MockResponse()
    
    func setup(boxOffice: WeeklyBoxOfficeList, movieInfo: MovieInfo) {
        let boxOfficeDTO = boxOffice.convertToDTO()
        let movieInfoDTO = movieInfo.convertToDTO()
        sut = BoxOfficeDetailViewModel(weeklyBoxOfficeListDTO: boxOfficeDTO)
        sut.movieInfoDTO = movieInfoDTO
    }
    
    func test_정보표시() {
        let boxOffice = mockResponse.mockWeeklyBoxOfficeList(rank: "3", movieNm: "해리포터", openDt: "20220202", salesAmt: "2000", salesAcc: "20000", audiCnt: "1000", audiAcc: "10000")
        let movieInfo = mockResponse.mockMovieInfo(movieCd: "20", showTm: "123")
        setup(boxOffice: boxOffice, movieInfo: movieInfo)
        XCTAssertEqual(sut.rank, "3")
        XCTAssertEqual(sut.movieName, "해리포터")
        XCTAssertEqual(sut.openDate, "20220202")
        XCTAssertEqual(sut.salesAmount, "2000")
        XCTAssertEqual(sut.salesTotalAmount, "20000")
        XCTAssertEqual(sut.audienceCount, "1000")
        XCTAssertEqual(sut.audienceTotalCount, "10000")
        XCTAssertEqual(sut.showTime, "123")
    }

}
