//
//  SearchMovieInfoResponse.swift
//  BoxOffice
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/25.
//

import Foundation
import ObjectMapper

struct SearchMovieInfo: ImmutableMappable {
    let movieInfo: MovieInfo?
    
    init(map: Map) throws {
        movieInfo = try? map.value("movieInfoResult.movieInfo")
    }
}

struct MovieInfo: ImmutableMappable {
    let movieCd: String?
    let showTm: String?
    
    init(map: Map) throws {
        movieCd = try? map.value("movieCd")
        showTm = try? map.value("showTm")
    }
}

extension MovieInfo {
    func convertToDTO() -> MovieInfoDTO {
        return MovieInfoDTO(
            movieCd: movieCd,
            showTm: showTm)
    }
}
