//
//  BoxOfficeResultDTO.swift
//  BoxOffice
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/24.
//

import Foundation

struct BoxOfficeResultDTO {
    let boxOfficeType: String?
    let showRange: String?
    let yearWeekTime: String?
    let weeklyBoxOfficeList: [WeeklyBoxOfficeListDTO]?

    init(boxOfficeType: String?,
         showRange: String?,
         yearWeekTime: String?,
         weeklyBoxOfficeList: [WeeklyBoxOfficeListDTO]?) {
        
        self.boxOfficeType = boxOfficeType
        self.showRange = showRange
        self.yearWeekTime = yearWeekTime
        self.weeklyBoxOfficeList = weeklyBoxOfficeList
    }
}
