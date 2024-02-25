//
//  SearchWeeklyDTO.swift
//  BoxOffice
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/24.
//

import Foundation

struct SearchWeeklyDTO {
    let boxOfficeResult: BoxOfficeResultDTO?
    
    init(boxOfficeResult: BoxOfficeResultDTO?) {
        self.boxOfficeResult = boxOfficeResult
    }
}
