//
//  MovieInfoDTO.swift
//  BoxOffice
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/25.
//

import Foundation

struct MovieInfoDTO {
    let movieCd: String?
    let showTm: String?
    
    init(movieCd: String?,
         showTm: String?) {
        self.movieCd = movieCd
        self.showTm = showTm
    }
}

