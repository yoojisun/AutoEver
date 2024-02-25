//
//  WeeklyBoxOfficeRepositoryImpl.swift
//  BoxOffice
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/24.
//

import Foundation

struct WeeklyBoxOfficeRepositoryImpl: WeeklyBoxOfficeRepository {
    func requestWeeklyBoxOfficeList(targetDt: String,
                                    weekGb: String,
                                    completion: @escaping ((SearchWeeklyDTO?) -> Void)) {
        provider.request(target: .searchWeekly(targetDt: targetDt,weekGb: weekGb)) { result in
            switch result {
            case .success(let boxOffice):
                guard let response = boxOffice as? SearchWeekly else {
                    return completion(nil)
                }
                completion(response.convertToDTO())
            case .error(_):
                completion(nil)
            }
        }
    }
}


