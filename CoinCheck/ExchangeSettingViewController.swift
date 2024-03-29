//
//  SettingViewController.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 23/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class ExchangeSettingViewController: UIViewController {
    // MARK: - Properties

    private var exchangeDataList: TradeDataResponse?
    private let currencyViewController = CurrencySettingViewController()

    // MARK: - UIs

    private let mainView: ExchangeSettingView = {
        let settingView = ExchangeSettingView()
        return settingView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "암호화폐 거래소 목록"
        self.mainView.exchangeSettingTableView.delegate = self
        self.mainView.exchangeSettingTableView.dataSource = self
        self.registerCell()
    }

    override func loadView() {
        self.view = self.mainView
    }
}

extension ExchangeSettingViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionIndex = ExchangeSettingTableViewSections(rawValue: section) else { return 0 }
        switch sectionIndex {
        case .mainSection: return Exchanges.ExchangeListString.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let exchangeTableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.exchangeTableCell, for: indexPath) as? ExchangeSettingTableViewCell else { return UITableViewCell() }
        exchangeTableViewCell.setExchangeCellData(title: "\(Exchanges.ExchangeListString[indexPath.row])")
        return exchangeTableViewCell
    }
}

extension ExchangeSettingViewController: UITableViewDelegate {
    func tableView(_: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionIndex = ExchangeSettingTableViewSections(rawValue: section) else { return UIView() }
        switch sectionIndex {
        case .mainSection: return ExchangeSettingTableHeaderView()
        }
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let sectionIndex = ExchangeSettingTableViewSections(rawValue: section) else { return CGFloat.leastNonzeroMagnitude }
        switch sectionIndex {
        case .mainSection: return ViewData.Size.cellHeaderHeight
        }
    }

    func tableView(_: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        CommonData.shared.selectedExchangeIndex = indexPath.row
        return indexPath
    }

    func tableView(_: UITableView, didSelectRowAt _: IndexPath) {
        self.navigationController?.pushViewController(self.currencyViewController, animated: true)
    }
}

extension ExchangeSettingViewController: UITableViewCellSettingProtocol {
    func registerCell() { self.mainView.exchangeSettingTableView.register(ExchangeSettingTableViewCell.self, forCellReuseIdentifier: CellIdentifier.exchangeTableCell)
    }
}
