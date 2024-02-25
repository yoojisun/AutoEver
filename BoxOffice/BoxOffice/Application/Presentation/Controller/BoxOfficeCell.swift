//
//  BoxOfficeCell.swift
//  BoxOffice
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/24.
//

import Foundation
import UIKit

final class BoxOfficeCell: UITableViewCell, TableViewCellProtocol {
    @IBOutlet private weak var rank: UILabel!
    @IBOutlet private weak var movieNm: UILabel!
    @IBOutlet private weak var openDt: UILabel!
    
    var viewModel: BoxOfficeCellViewModel? {
        didSet {
            configure()
        }
    }

    func setViewModel(_ viewModel: TableViewCellViewModelProtocol) {
        self.viewModel = viewModel as? BoxOfficeCellViewModel
    }
    
    private func configure() {
        guard let viewModel = viewModel else { return }
        rank.text = viewModel.rank
        movieNm.text = viewModel.movieNm
        openDt.text = viewModel.openDt
    }
}
