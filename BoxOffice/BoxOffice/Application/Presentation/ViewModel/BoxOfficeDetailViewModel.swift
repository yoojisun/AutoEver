//
//  BoxOfficeDetailViewModel.swift
//  BoxOffice
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/25.
//

import Foundation

final class BoxOfficeDetailViewModel {
    var movieInfoDTO: MovieInfoDTO?
    var weeklyBoxOfficeListDTO: WeeklyBoxOfficeListDTO?
    
    init(weeklyBoxOfficeListDTO: WeeklyBoxOfficeListDTO?) {
        self.weeklyBoxOfficeListDTO = weeklyBoxOfficeListDTO
    }
    
    private var movieInfoRepository: MovieInfoRepository { MovieInfoRepositoryImpl() }
    private var movieInfoUseCase: MovieInfoUseCase {
        MovieInfoUseCase(movieInfoRepository: movieInfoRepository)
    }
    
    func execute(compltion: @escaping (()-> Void)) {
        guard let movieCd = weeklyBoxOfficeListDTO?.movieCd else { return }
        movieInfoUseCase.execute(movieCd: movieCd) { result in
            self.movieInfoDTO = result
            compltion()
        }
    }
    
    var rank: String { weeklyBoxOfficeListDTO?.rank ?? ""}
    var movieName: String { weeklyBoxOfficeListDTO?.movieNm ?? ""}
    var openDate: String { weeklyBoxOfficeListDTO?.openDt ?? "" }
    var salesAmount: String { weeklyBoxOfficeListDTO?.salesAmt ?? ""}
    var salesTotalAmount: String { weeklyBoxOfficeListDTO?.salesAcc ?? ""}
    var audienceCount: String { weeklyBoxOfficeListDTO?.audiCnt ?? "" }
    var audienceTotalCount: String { weeklyBoxOfficeListDTO?.audiAcc ?? ""}
    var showTime: String { movieInfoDTO?.showTm ?? "" }
}
