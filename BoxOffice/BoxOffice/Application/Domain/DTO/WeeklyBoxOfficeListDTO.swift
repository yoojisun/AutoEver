//
//  WeeklyBoxOfficeListDTO.swift
//  BoxOffice
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/24.
//

import Foundation

struct WeeklyBoxOfficeListDTO {
    let rank: String?
    let movieNm: String?
    let openDt: String?
    let salesAmt: String?
    let salesAcc: String?
    let audiCnt: String?
    let audiAcc: String?
    let movieCd: String?
    
    init(rank: String?,
         movieNm: String?,
         openDt: String?,
         salesAmt: String?,
         salesAcc: String?,
         audiCnt: String?,
         audiAcc: String?,
         movieCd: String?) {
        
        self.rank = rank
        self.movieNm = movieNm
        self.openDt = openDt
        self.salesAmt = salesAmt
        self.salesAcc = salesAcc
        self.audiCnt = audiCnt
        self.audiAcc = audiAcc
        self.movieCd = movieCd
    }
}
