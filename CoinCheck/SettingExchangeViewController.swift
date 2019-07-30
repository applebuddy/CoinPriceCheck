//
//  SettingViewController.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 23/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

public enum SettingTableViewSections: Int {
    case mainSection = 0
}

internal class SettingExchangeViewController: UIViewController {
    // MARK: - Properties

    let settingTableViewIdentifier = "SettingTableView"
    var exchangeDataList: TradeResponse?

    // MARK: - UIs

    let settingView: SettingExchangeView = {
        let settingView = SettingExchangeView()
        return settingView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "암호화폐 거래소 목록"
        self.settingView.settingExchangeTableView.delegate = self
        self.settingView.settingExchangeTableView.dataSource = self
        self.registerCell()
    }

    override func loadView() {
        super.loadView()
        self.view = self.settingView
    }
}

extension SettingExchangeViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionIndex = SettingTableViewSections(rawValue: section) else { return 0 }
        switch sectionIndex {
        case .mainSection: return Exchanges.ExchangeListString.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let exchangeTableViewCell = tableView.dequeueReusableCell(withIdentifier: settingTableViewIdentifier, for: indexPath) as? ExchangeTableViewCell else { return UITableViewCell() }
        exchangeTableViewCell.setExchangeCellData(title: "\(Exchanges.ExchangeListString[indexPath.row])")
        return exchangeTableViewCell
    }
}

extension SettingExchangeViewController: UITableViewDelegate {
    func tableView(_: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionIndex = SettingTableViewSections(rawValue: section) else { return UIView() }
        switch sectionIndex {
        case .mainSection: return ExchangeTableHeaderView()
        }
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let sectionIndex = SettingTableViewSections(rawValue: section) else { return CGFloat.leastNonzeroMagnitude }
        switch sectionIndex {
        case .mainSection: return ViewSize.cellHeaderHeight
        }
    }

    func tableView(_: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        CommonData.shared.selectedExchangeIndex = indexPath.row
        return indexPath
    }

    func tableView(_: UITableView, didSelectRowAt _: IndexPath) {
        let currencyViewController = CurrencyViewController()
        self.navigationController?.pushViewController(currencyViewController, animated: true)
    }
}

extension SettingExchangeViewController: UITableViewCellSettingProtocol {
    func registerCell() { self.settingView.settingExchangeTableView.register(ExchangeTableViewCell.self, forCellReuseIdentifier: self.settingTableViewIdentifier)
    }
}
