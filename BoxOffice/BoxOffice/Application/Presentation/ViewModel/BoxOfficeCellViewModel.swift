//
//  BoxOfficeCellViewModel.swift
//  BoxOffice
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/24.
//

import Foundation

struct BoxOfficeCellViewModel: TableViewCellViewModelProtocol {
    var height: CGFloat = 60
    var identifier: String = "BoxOfficeCellViewModel"
    
    var weeklyBoxOfficeListDTO: WeeklyBoxOfficeListDTO?
    
    init(weeklyBoxOfficeListDTO: WeeklyBoxOfficeListDTO?) {
        self.weeklyBoxOfficeListDTO = weeklyBoxOfficeListDTO
    }

    var rank: String { weeklyBoxOfficeListDTO?.rank ?? "0" }
    
    var movieNm: String { weeklyBoxOfficeListDTO?.movieNm ?? "0" }
    
    var openDt: String { weeklyBoxOfficeListDTO?.openDt ?? "0" }
}
