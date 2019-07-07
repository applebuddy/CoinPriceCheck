//
//  SettingViewController.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 23/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

enum SettingTableViewSections: Int {
    case mainSection = 0
}

class SettingExchangeViewController: UIViewController {
    let settingTableViewIdentifier = "SettingTableView"
    var exchangeDataList: TradeResponse?
    
    let settingView: SettingView = {
        let settingView = SettingView()
        return settingView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ㅠ_ㅠ"
        self.settingView.settingTableView.delegate = self
        self.settingView.settingTableView.dataSource = self
        self.registCell()
    }

    override func loadView() {
        super.loadView()
        self.view = self.settingView
    }

    func registCell() {
        self.settingView.settingTableView.register(SettingTableViewCell.self, forCellReuseIdentifier: self.settingTableViewIdentifier)
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
        guard let settingTableViewCell = tableView.dequeueReusableCell(withIdentifier: settingTableViewIdentifier, for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
        settingTableViewCell.titleLabel.text = "\(Exchanges.ExchangeListString[indexPath.row])"
//        settingTableViewCell.titleLabel.text = exchangeData.data.abt.
        return settingTableViewCell
    }
}

extension SettingExchangeViewController: UITableViewDelegate {
    func tableView(_: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionIndex = SettingTableViewSections(rawValue: section) else { return UIView() }
        switch sectionIndex {
        case .mainSection: return SettingTableHeaderView()
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
