//
//  BithumbInfoViewController.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 01/07/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class CurrencySettingViewController: UIViewController {
    // MARK: - Properties

    private var currencyNameString: [String]?
    private var shownCurrencyNameString: [String]?
    private var nowIndexPath: IndexPath?
    private var isSearched: Bool = false

    // MARK: Timer

    private var checkTimer: Timer = {
        let checkTimer = Timer()
        return checkTimer
    }()

    // MARK: - UIs

    private let mainView: CurrencySettingView = {
        let mainView = CurrencySettingView()
        return mainView
    }()

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        view = self.mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.currencyTableView.delegate = self
        self.mainView.currencyTableView.dataSource = self
        self.mainView.searchBar.delegate = self
        self.mainView.currencyTableView.allowsSelection = false
        self.registerCell()
        self.setBithumbData()
        self.setCellData()
        self.setCheckTimer()
    }

    override func viewDidAppear(_: Bool) {
        super.viewDidAppear(true)
    }

    // MARK: - Methods

    // MARK: Setting

    private func setCheckTimer() {
        self.checkTimer = Timer.scheduledTimer(timeInterval: 6.0, target: self, selector: #selector(self.refreshBithumbData(_:)), userInfo: nil, repeats: true)
    }

    private func presentAlertViewController(errorString: String) {
        let alertController = UIAlertController(title: "문제가 발생하였습니다.", message: errorString, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }

    private func setCellData() {
        guard let exchangeIndex = ExchangeIndex(rawValue: CommonData.shared.selectedExchangeIndex) else { return }
        switch exchangeIndex {
        case .bithumb:
            self.currencyNameString = BithumbCurrencies.shared.currencyNameString
            navigationItem.title = "Bithumb 암호화폐 정보"
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
            CommonData.shared.tradeData = try decoder.decode(TradeResponse.self, from: contents)
            // 데이터 처리하는 곳
        } catch let DecodingError.dataCorrupted(context) {
            presentAlertViewController(errorString: "\(context)")
        } catch let DecodingError.keyNotFound(key, context) {
            presentAlertViewController(errorString: "key: \(key), context: \(context)")
        } catch let DecodingError.valueNotFound(_, context) {
            presentAlertViewController(errorString: "\(context)")
        } catch DecodingError.typeMismatch(_, _) {
            self.presentAlertViewController(errorString: "Type Mismatched")
        } catch {
            self.presentAlertViewController(errorString: "\(error.localizedDescription)")
        }
    }

    @objc func refreshBithumbData(_: Timer) {
        self.setBithumbData()
        self.setCellData()
        self.mainView.currencyTableView.reloadData()
    }
}

extension CurrencySettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currencyNameString = BithumbCurrencies.shared.currencyNameString
        guard let bithumbTableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.bithumbTableCell, for: indexPath) as? CurrencySettingTableViewCell,
            let currencyPrice = CommonData.shared.tradeData?.data.arr[indexPath.row].closingPrice,
            let currencyButtonKey = BithumbCurrencies.shared.entireCurrencyKey[currencyNameString[indexPath.row]] else { return UITableViewCell() }

        bithumbTableViewCell.delegate = self
        self.nowIndexPath = indexPath

        if self.isSearched == true {
            guard let shownCurrencyNameString = self.shownCurrencyNameString?[indexPath.row],
                let currencyButtonKey = BithumbCurrencies.shared.entireCurrencyKey[shownCurrencyNameString] else { return UITableViewCell() }
            let title = "\(shownCurrencyNameString)"
            let price = "\(currencyPrice)"
            bithumbTableViewCell.setCurrencyCellData(title: title, price: price)
            bithumbTableViewCell.setStarButton(key: currencyButtonKey)
        } else {
            let title = "\(currencyNameString[indexPath.row])"
            let price = "\(currencyPrice)"
            bithumbTableViewCell.setCurrencyCellData(title: title, price: price)
            bithumbTableViewCell.setStarButton(key: currencyButtonKey)
        }
        return bithumbTableViewCell
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionIndex = CurrencySettingTableViewSections(rawValue: section) else { return 0 }
        let currencyNameString = BithumbCurrencies.shared.currencyNameString

        if self.isSearched == true {
            let shownCurrencyNameString = self.shownCurrencyNameString
            switch sectionIndex {
            case .mainSection: return shownCurrencyNameString?.count ?? 0
            }
        } else {
            switch sectionIndex {
            case .mainSection: return currencyNameString.count
            }
        }
    }
}

extension CurrencySettingViewController: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return ViewData.Size.cellDefaultHeight
    }
}

extension CurrencySettingViewController: UISearchBarDelegate {
    func searchBar(_: UISearchBar, textDidChange _: String) {
        if self.mainView.searchBar.text?.trimmingCharacters(in: .whitespaces).isEmpty == true {
            self.isSearched = false
            self.mainView.currencyTableView.reloadData()
        } else {
            self.isSearched = true
            self.mainView.currencyTableView.reloadData()
        }
    }
}

extension CurrencySettingViewController: CurrencyTableViewCellDelegate {
    func starButtonPressed(index _: Int, _ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.mainView.currencyTableView.reloadData()
    }
}

extension CurrencySettingViewController: UITableViewCellSettingProtocol {
    func registerCell() {
        self.mainView.currencyTableView.register(CurrencySettingTableViewCell.self, forCellReuseIdentifier: CellIdentifier.bithumbTableCell)
    }
}
