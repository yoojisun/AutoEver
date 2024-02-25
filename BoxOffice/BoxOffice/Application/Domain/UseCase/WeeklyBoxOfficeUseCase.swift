//
//  WeeklyBoxOfficeUseCase.swift
//  BoxOffice
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/24.
//

import Foundation

final class WeeklyBoxOfficeUseCase {
    let weeklyBoxOfficeRepository: WeeklyBoxOfficeRepository
    
    init(weeklyBoxOfficeRepository: WeeklyBoxOfficeRepository) {
        self.weeklyBoxOfficeRepository = weeklyBoxOfficeRepository
    }
    
    func execute(targetDt: String,
                 weekGb: String,
                 completion: @escaping ((SearchWeeklyDTO?) -> Void)) {
        weeklyBoxOfficeRepository.requestWeeklyBoxOfficeList(
            targetDt: targetDt,
            weekGb: weekGb
        ) { result in
            guard result != nil else { return }
            completion(result)
        }
    }
}
