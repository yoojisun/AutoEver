//
//  WeeklyBoxOfficeRepository.swift
//  BoxOffice
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/24.
//

import Foundation

protocol WeeklyBoxOfficeRepository {
    func requestWeeklyBoxOfficeList(
        targetDt: String,
        weekGb: String,
        completion: @escaping ((SearchWeeklyDTO?) -> Void))
}
