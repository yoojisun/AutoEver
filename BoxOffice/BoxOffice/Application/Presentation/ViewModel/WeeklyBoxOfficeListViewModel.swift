//
//  WeeklyBoxOfficeListViewModel.swift
//  BoxOffice
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/24.
//

import Foundation
import UIKit

final class WeeklyBoxOfficeListViewModel {
    var boxOffice: BoxOfficeResultDTO?
    var targetDt: String?
    var weekGb: String? = "1"

    private var weeklyBoxOfficeRepository: WeeklyBoxOfficeRepository { WeeklyBoxOfficeRepositoryImpl() }
    
    private var weeklyBoxOfficeUseCase: WeeklyBoxOfficeUseCase {
        WeeklyBoxOfficeUseCase(weeklyBoxOfficeRepository: weeklyBoxOfficeRepository)
    }
    
    var cellViewModels: [TableViewCellViewModelProtocol] = []
    
    func makeCellViewModels() {
        var cellViewModels: [TableViewCellViewModelProtocol] = []
        
        boxOffice?.weeklyBoxOfficeList?.forEach {
            cellViewModels.append(BoxOfficeCellViewModel(weeklyBoxOfficeListDTO: $0))
        }
        self.cellViewModels = cellViewModels
    }
    
    func execute(compltion: @escaping ((Bool) -> Void)) {
        weeklyBoxOfficeUseCase.execute(targetDt: targetDt ?? "20200202", weekGb: weekGb ?? "1") { result in
            guard result?.boxOfficeResult?.weeklyBoxOfficeList?.isEmpty == false else {
                compltion(false)
                return
            }
            self.boxOffice = result?.boxOfficeResult
            self.makeCellViewModels()
            compltion(true)
        }
    }
}
