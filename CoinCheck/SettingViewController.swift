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

class SettingViewController: UIViewController {
    
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
        registCell()
        setCellData()
    }
    
    override func loadView() {
        super.loadView()
        self.view = settingView
    }
    
    func registCell() {
        self.settingView.settingTableView.register(SettingTableViewCell.self, forCellReuseIdentifier: settingTableViewIdentifier)
    }
    
    func setCellData() {
        // "https://api.bithumb.com/public/orderbook/ALL"
        // "https://api.bithumb.com/public/ticker/ALL"
        let urlString: String = "https://api.bithumb.com/public/ticker/ALL"
        guard let url = URL(string: urlString) else { return }
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let contents = try Data(contentsOf: url)
            CommonData.shared.tradeData = try decoder.decode(TradeResponse.self, from: contents)
            print("\(CommonData.shared.tradeData?.data.ae)")
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Type '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:",context.codingPath)
        } catch {
            print("Unable to parse JSON : \(error.localizedDescription)")
        }
    }
}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionIndex = SettingTableViewSections(rawValue: section),
        let exchangeData = exchangeDataList else { return 0 }
        switch sectionIndex {
        case .mainSection: return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let settingTableViewCell = tableView.dequeueReusableCell(withIdentifier: settingTableViewIdentifier, for: indexPath) as? SettingTableViewCell,
        let exchangeData = exchangeDataList else { return UITableViewCell() }

//        settingTableViewCell.titleLabel.text = exchangeData.data.abt.
        return settingTableViewCell
    }
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionIndex = SettingTableViewSections(rawValue: section) else { return UIView() }
        switch sectionIndex {
        case .mainSection: return SettingTableHeaderView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let sectionIndex = SettingTableViewSections(rawValue: section) else { return CGFloat.leastNonzeroMagnitude }
        switch sectionIndex {
        case .mainSection: return ViewSize.cellHeaderHeight
        }
    }
}
