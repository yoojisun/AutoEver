//
//  MovieInfoRepository.swift
//  BoxOffice
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/25.
//

import Foundation

protocol MovieInfoRepository {
    func requestMovieInfo(
        movieCd: String,
        completion: @escaping((MovieInfoDTO?) -> Void))
}
