//
//  WeeklyBoxOfficeListViewController.swift
//  BoxOffice
//
//  Created by 유지선(Yoo,JiSun) on 2024/02/24.
//

import Foundation
import UIKit
import SnapKit

final class WeeklyBoxOfficeListViewController: UIViewController {
    private var viewModel = WeeklyBoxOfficeListViewModel()
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var picker: UIDatePicker!
    @IBOutlet var weeklyButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initial()
    }
    
    private func initial() {
        self.title = "박스오피스"
        self.view.backgroundColor = .white
        picker.datePickerMode = .date
        if let initialIndex = viewModel.weekGb,
            let index = Int(initialIndex), index < weeklyButtons.count {
            for (buttonIndex, button) in weeklyButtons.enumerated() {
                if buttonIndex == index {
                    button.isSelected = true
                } else {
                    button.isSelected = false
                }
            }
        }
        
        let selectedDate = picker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let dateString = dateFormatter.string(from: selectedDate)
        viewModel.targetDt = dateString
    }
}

extension WeeklyBoxOfficeListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.cellViewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.identifier, for: indexPath)
        if let cell = cell as? TableViewCellProtocol {
            cell.setViewModel(cellViewModel)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.cellViewModels[indexPath.row].height
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.cellViewModels[indexPath.row].height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellViewModel = viewModel.cellViewModels[indexPath.row] as? BoxOfficeCellViewModel else { return }
        let detail = BoxOfficeDetailViewController()
        let viewModel = BoxOfficeDetailViewModel(weeklyBoxOfficeListDTO: cellViewModel.weeklyBoxOfficeListDTO)
        detail.viewModel = viewModel
        navigationController?.pushViewController(detail, animated: true)
    }
}

private extension WeeklyBoxOfficeListViewController {
    @IBAction func clickWeek(weeklyButton: UIButton) {
        weeklyButtons.forEach { $0.isSelected = false }
        weeklyButton.isSelected = true
        if let index = weeklyButtons.firstIndex(of: weeklyButton) {
            viewModel.weekGb = String(index)
        }
    }
    
    @IBAction func clickBoxOffice() {
        viewModel.execute { result in
            guard result else {
                self.showAlert(
                    message: "선택하신 날짜에 조회 결과가 없습니다. 다른 날짜를 선택해주세요."
                )
                return
            }
            self.tableView.reloadData()
        }
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let dateString = dateFormatter.string(from: selectedDate)
        viewModel.targetDt = dateString
    }
}

private extension WeeklyBoxOfficeListViewController {
    func showAlert(message: String) {
        let alert = UIAlertController(
            title: "알림",
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "확인",
            style: .default,
            handler: nil
        )
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
