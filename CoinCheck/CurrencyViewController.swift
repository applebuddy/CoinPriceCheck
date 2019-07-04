//
//  BithumbInfoViewController.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 01/07/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

enum BithumbTableViewSections: Int {
    case mainSection = 0
}

class CurrencyViewController: UIViewController {
    let bithumbTableViewCellIdentifier: String = "bithumbTableViewCellIdentifier"
    var currencyNameString: [String] = []
    let mainView: BithumbInfoView = {
        let mainView = BithumbInfoView()
        return mainView
    }()

    // MARK: - ViewController App Cycle

    override func loadView() {
        super.loadView()
        self.view = self.mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.bithumbTableView.register(BithumbTableViewCell.self, forCellReuseIdentifier: self.bithumbTableViewCellIdentifier)
        self.mainView.bithumbTableView.delegate = self
        self.mainView.bithumbTableView.dataSource = self
        self.setCellData()
    }

    func setCellData() {
        guard let exchangeIndex = ExchangeIndex(rawValue: CommonData.shared.selectedExchangeIndex) else { return }
        switch exchangeIndex {
        case .bithumb:
            self.currencyNameString = BithumbCurrencies.bithumbCurrencyNameString
            self.navigationItem.title = "Bithumb 암호화폐 현항"
            self.setBithumbData()
        }
    }

    func setBithumbData() {
        // "https://api.bithumb.com/public/orderbook/ALL"
        // "https://api.bithumb.com/public/ticker/ALL"
        let urlString: String = "https://api.bithumb.com/public/ticker/ALL"
        guard let url = URL(string: urlString) else { return }
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let contents = try Data(contentsOf: url)
            let tradeData = try decoder.decode(TradeResponse.self, from: contents)
            // 데이터 처리하는 곳
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
            print("codingPath:", context.codingPath)
        } catch {
            print("Unable to parse JSON : \(error.localizedDescription)")
        }
    }
}

extension CurrencyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let bithumbTableViewCell = tableView.dequeueReusableCell(withIdentifier: bithumbTableViewCellIdentifier, for: indexPath) as? BithumbTableViewCell else { return UITableViewCell() }
        bithumbTableViewCell.titleLabel.text = "\(self.currencyNameString[indexPath.row])"
        return bithumbTableViewCell
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionIndex = BithumbTableViewSections(rawValue: section) else { return 0 }
        switch sectionIndex {
        case .mainSection: return self.currencyNameString.count
        }
    }
}

extension CurrencyViewController: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 100
    }
}
