//
//  MovieInfoUseCase.swift
//  BoxOffice
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/25.
//

import Foundation

final class MovieInfoUseCase {
    let movieInfoRepository: MovieInfoRepository
    
    init(movieInfoRepository: MovieInfoRepository) {
        self.movieInfoRepository = movieInfoRepository
    }
    
    func execute(movieCd: String,
                 completion: @escaping ((MovieInfoDTO?) -> Void)) {
        movieInfoRepository.requestMovieInfo(
            movieCd: movieCd
        ) { result in
            guard result != nil else { return }
            completion(result)
        }
    }
}
