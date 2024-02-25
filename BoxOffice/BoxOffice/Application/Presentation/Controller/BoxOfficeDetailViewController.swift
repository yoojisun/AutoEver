//
//  BoxOfficeDetailViewController.swift
//  BoxOffice
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/24.
//

import Foundation
import UIKit
import SnapKit

final class BoxOfficeDetailViewController: UIViewController {
    private var rankLabel: UILabel!
    private var movieNameLabel: UILabel!
    private var openDateLabel: UILabel!
    private var salesAmountLabel: UILabel!
    private var salesTotalAmountLabel: UILabel!
    private var audienceCountLabel: UILabel!
    private var audienceTotalCountLabel: UILabel!
    private var showTmLabel: UILabel!
    private var genresLabel: UILabel!
    private var directorsLabel: UILabel!
    
    var viewModel: BoxOfficeDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel?.execute {
            self.configureLabels()
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        rankLabel = UILabel()
        view.addSubview(rankLabel)
        
        movieNameLabel = UILabel()
        view.addSubview(movieNameLabel)
        
        openDateLabel = UILabel()
        view.addSubview(openDateLabel)
        
        salesAmountLabel = UILabel()
        view.addSubview(salesAmountLabel)
        
        salesTotalAmountLabel = UILabel()
        view.addSubview(salesTotalAmountLabel)
        
        audienceCountLabel = UILabel()
        view.addSubview(audienceCountLabel)
        
        audienceTotalCountLabel = UILabel()
        view.addSubview(audienceTotalCountLabel)
        
        showTmLabel = UILabel()
        view.addSubview(showTmLabel)
        
        genresLabel = UILabel()
        view.addSubview(genresLabel)
        
        directorsLabel = UILabel()
        view.addSubview(directorsLabel)
        
        rankLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(20)
        }
        
        movieNameLabel.snp.makeConstraints { make in
            make.top.equalTo(rankLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(20)
        }
        
        openDateLabel.snp.makeConstraints { make in
            make.top.equalTo(movieNameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(20)
        }
        
        salesAmountLabel.snp.makeConstraints { make in
            make.top.equalTo(openDateLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(20)
        }
        
        salesTotalAmountLabel.snp.makeConstraints { make in
            make.top.equalTo(salesAmountLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(20)
        }
        
        audienceCountLabel.snp.makeConstraints { make in
            make.top.equalTo(salesTotalAmountLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(20)
        }
        
        audienceTotalCountLabel.snp.makeConstraints { make in
            make.top.equalTo(audienceCountLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(20)
        }
        
        showTmLabel.snp.makeConstraints { make in
            make.top.equalTo(audienceTotalCountLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(20)
        }
    }
    
    private func configureLabels() {
        guard let viewModel = viewModel else { return }
        rankLabel.text = "박스오피스 순위: \(viewModel.rank)위"
        movieNameLabel.text = "영화명(국문): \(viewModel.movieName)"
        openDateLabel.text = "개봉일: \(viewModel.openDate)"
        salesAmountLabel.text = "매출액: \(viewModel.salesAmount)"
        salesTotalAmountLabel.text = "누적매출액: \(viewModel.salesTotalAmount)"
        audienceCountLabel.text = "관객수: \(viewModel.audienceCount) 명"
        audienceTotalCountLabel.text = "누적관객수: \(viewModel.audienceTotalCount) 명"
        showTmLabel.text = "상영시간: \(viewModel.showTime) 분"
    }
}
