//
//  WeeklyBoxOfficeListViewModelTests.swift
//  BoxOfficeTests
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/25.
//

import XCTest
@testable import BoxOffice

final class WeeklyBoxOfficeListViewModelTests: XCTestCase {
    var sut: WeeklyBoxOfficeListViewModel?
    var mockResponse = MockResponse()
    
    func setup(boxOfficeList: BoxOfficeResult?) {
        sut = WeeklyBoxOfficeListViewModel()
        let boxOfficeResultDTO = boxOfficeList?.convertToDTO()
        sut?.boxOffice = boxOfficeResultDTO
        sut?.makeCellViewModels()
    }
    
    func test_영화리스트비었을때() {
        setup(boxOfficeList: nil)
        XCTAssertFalse(sut?.cellViewModels.contains { $0 is BoxOfficeCellViewModel } ?? false )
        let count = sut?.cellViewModels.filter { $0.identifier == "BoxOfficeCellViewModel" }.count ?? 0
        XCTAssertEqual(count, 0)
    }
    
    func test_영화리스트3개() {
        let boxOffice1 = mockResponse.mockWeeklyBoxOfficeList(rank: "1", movieNm: "해리포터 마법사의 돌", openDt: "20220202")
        let boxOffice2 = mockResponse.mockWeeklyBoxOfficeList(rank: "2", movieNm: "해리포터 비밀의 방", openDt: "20220202")
        let boxOffice3 = mockResponse.mockWeeklyBoxOfficeList(rank: "3", movieNm: "해리포터 아즈카반의 죄수", openDt: "20220202")
        let boxOfficeResult = mockResponse.mockBoxOfficeResult(weeklyBoxOfficeList: [boxOffice1, boxOffice2, boxOffice3])
        setup(boxOfficeList: boxOfficeResult)
        XCTAssertTrue(sut?.cellViewModels.contains { $0 is BoxOfficeCellViewModel } ?? true)
        let count = sut?.cellViewModels.filter { $0.identifier == "BoxOfficeCellViewModel" }.count ?? 0
        XCTAssertEqual(count, 3)
    }
}
