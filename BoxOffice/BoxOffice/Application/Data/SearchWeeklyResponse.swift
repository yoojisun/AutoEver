//
//  SearchWeeklyResponse.swift
//  BoxOffice
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/23.
//

import Foundation
import ObjectMapper

struct SearchWeekly: ImmutableMappable {
    let boxOfficeResult: BoxOfficeResult?
    
    init(map: Map) throws {
        boxOfficeResult = try? map.value("boxOfficeResult")
    }
}

struct BoxOfficeResult: ImmutableMappable {
    let boxOfficeType: String?
    let showRange: String?
    let yearWeekTime: String?
    let weeklyBoxOfficeList: [WeeklyBoxOfficeList]?
    
    init(map: Map) throws {
        boxOfficeType = try? map.value("boxOfficeType")
        showRange = try? map.value("showRange")
        yearWeekTime = try? map.value("yearWeekTime")
        weeklyBoxOfficeList = try? map.value("weeklyBoxOfficeList")
    }
}

struct WeeklyBoxOfficeList: ImmutableMappable {
    let rank: String?
    let movieNm: String?
    let openDt: String?
    let salesAmt: String?
    let salesAcc: String?
    let audiCnt: String?
    let audiAcc: String?
    let movieCd: String?
    
    init(map: Map) throws {
        rank = try? map.value("rank")
        movieNm = try? map.value("movieNm")
        openDt = try? map.value("openDt")
        salesAmt = try? map.value("salesAmt")
        salesAcc = try? map.value("salesAcc")
        audiCnt = try? map.value("audiCnt")
        audiAcc = try? map.value("audiAcc")
        movieCd = try? map.value("movieCd")
    }
}

extension WeeklyBoxOfficeList {
    func convertToDTO() -> WeeklyBoxOfficeListDTO {
        return WeeklyBoxOfficeListDTO(
            rank: rank,
            movieNm: movieNm,
            openDt: openDt,
            salesAmt: salesAmt,
            salesAcc: salesAcc,
            audiCnt: audiCnt,
            audiAcc: audiAcc,
            movieCd: movieCd)
    }
}

extension BoxOfficeResult {
    func convertToDTO() -> BoxOfficeResultDTO {
        return BoxOfficeResultDTO(
            boxOfficeType: boxOfficeType,
            showRange: showRange,
            yearWeekTime: yearWeekTime,
            weeklyBoxOfficeList: weeklyBoxOfficeList?.map {
                return WeeklyBoxOfficeListDTO(
                    rank: $0.rank,
                    movieNm: $0.movieNm,
                    openDt: $0.openDt,
                    salesAmt: $0.salesAmt,
                    salesAcc: $0.salesAcc,
                    audiCnt: $0.audiCnt,
                    audiAcc: $0.audiAcc,
                    movieCd: $0.movieCd)
            }
        )
    }
}

extension SearchWeekly {
    func convertToDTO() -> SearchWeeklyDTO {
        return SearchWeeklyDTO(
            boxOfficeResult: boxOfficeResult?.convertToDTO()
        )
    }
}
