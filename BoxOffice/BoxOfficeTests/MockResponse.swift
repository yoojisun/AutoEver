//
//  MockResponse.swift
//  BoxOfficeTests
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/25.
//

import Foundation
@testable import BoxOffice

struct MockResponse {
    func mockWeeklyBoxOfficeList(
        rank: String,
        movieNm: String,
        openDt: String,
        salesAmt: String? = "",
        salesAcc: String? = "",
        audiCnt: String? = "",
        audiAcc: String? = "",
        movieCd: String? = ""
    ) -> WeeklyBoxOfficeList {
        WeeklyBoxOfficeList.new(json: [
            "rank" : rank,
            "movieNm" : movieNm,
            "openDt" : openDt,
            "salesAmt" : salesAmt ?? "",
            "salesAcc" : salesAcc ?? "",
            "audiCnt" : audiCnt ?? "",
            "audiAcc" : audiAcc ?? "",
            "movieCd" : movieCd ?? ""
        ])
    }
    
    func mockBoxOfficeResult(
        weeklyBoxOfficeList: [WeeklyBoxOfficeList]
    ) -> BoxOfficeResult {
        BoxOfficeResult.new(json: [
            "weeklyBoxOfficeList": weeklyBoxOfficeList.map { $0.toJson() }
        ])
    }
    
    func mockMovieInfo(
        movieCd: String?,
        showTm: String?
    ) -> MovieInfo {
        MovieInfo.new(json: [
            "movieCd" : movieCd ?? "",
            "showTm" : showTm ?? "",
        ])
    }
}

extension WeeklyBoxOfficeList {
    func toJson() -> [String: Any] {
        var map: [String: Any] = [:]
        map["rank"] = rank
        map["movieNm"] = movieNm
        map["openDt"] = openDt
        map["salesAmt"] = salesAmt
        map["salesAcc"] = salesAcc
        map["audiCnt"] = audiCnt
        map["audiAcc"] = audiAcc
        map["movieCd"] = movieCd
        return map
    }
}
