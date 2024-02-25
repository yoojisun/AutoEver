//
//  MovieInfoRepositoryImpl.swift
//  BoxOffice
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/25.
//

import Foundation

struct MovieInfoRepositoryImpl: MovieInfoRepository {
    func requestMovieInfo(movieCd: String,
                          completion: @escaping ((MovieInfoDTO?) -> Void)) {
        provider.request(target: .searchMovieInfo(movieCd: movieCd)) { result in
            switch result {
            case .success(let boxOffice):
                guard let response = boxOffice as? SearchMovieInfo else {
                    return completion(nil)
                }
                completion(response.movieInfo?.convertToDTO())
            case .error(_):
                completion(nil)
            }
        }
    }
}
