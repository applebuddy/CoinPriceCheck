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
        view = self.mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.mainView.searchBar.delegate = self

        self.setCheckTimer()
        self.setBithumbData()
        self.setCurrencyData()
    }

    override func viewDidAppear(_: Bool) {
        super.viewDidAppear(true)
    }

    override func viewWillDisappear(_: Bool) {
        super.viewWillDisappear(true)
        self.checkTimer.invalidate()
    }

    // MARK: - Methods

    // MARK: Setting

    private func setCheckTimer() {
        self.checkTimer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(self.refreshBithumbData(_:)), userInfo: nil, repeats: true)
    }

    private func presentAlertViewController(errorString: String) {
        let alertController = UIAlertController(title: "문제가 발생하였습니다.", message: errorString, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }

    private func setCurrencyData() {
        guard let exchangeIndex = ExchangeIndex(rawValue: CommonData.shared.selectedExchangeIndex) else { return }
        switch exchangeIndex {
        case .bithumb:
            self.currencyNameString = BithumbCurrencies.shared.currencyNameString
            navigationItem.title = "Bithumb 암호화폐 정보"
        }
    }

    // MARK: -  ** API 데이터를 받아 온 뒤 델리게이션 사용을 해야 나오는데, 어떻게 개선해야할 지 생각해봐야 한다.**

    func setBithumbData() {
        // "https://api.bithumb.com/public/orderbook/ALL"
        // "https://api.bithumb.com/public/ticker/ALL"
        let urlString: String = "https://api.bithumb.com/public/ticker/ALL"
        RequestAPI.requestCurrencyData(urlString: urlString, returnType: TradeDataResponse.self, requestType: .tradeData) { tradeData in
            CommonData.shared.tradeData = tradeData

            self.mainView.currencyTableView.dataSource = self
            self.mainView.currencyTableView.delegate = self
            DispatchQueue.main.async {
                self.mainView.currencyTableView.reloadData()
            }
        }
    }

    func registerCell() {
        self.mainView.currencyTableView.register(CurrencySettingTableViewCell.self, forCellReuseIdentifier: CellIdentifier.setCurrencyTableCell)
    }

    @objc func refreshBithumbData(_: Timer) {
        self.setBithumbData()
        self.setCurrencyData()
    }
}

extension CurrencySettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currencyNameString = BithumbCurrencies.shared.currencyNameString
        guard let currencySettingTableCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.setCurrencyTableCell, for: indexPath) as? CurrencySettingTableViewCell,
            let currencyPrice = CommonData.shared.tradeData?.data.arr[indexPath.row].closingPrice,
            let currencyButtonKey = BithumbCurrencies.shared.entireCurrencyKey[currencyNameString[indexPath.row]] else { return UITableViewCell() }

        currencySettingTableCell.delegate = self
        self.nowIndexPath = indexPath

        // 검색 중일 경우
        if self.isSearched == true {
            guard let shownCurrencyNameString = self.shownCurrencyNameString?[indexPath.row],
                let currencyButtonKey = BithumbCurrencies.shared.entireCurrencyKey[shownCurrencyNameString],
                let currencyIndex = currencyNameString.firstIndex(of: shownCurrencyNameString),
                let currencyPrice = CommonData.shared.tradeData?.data.arr[currencyIndex].closingPrice else { return UITableViewCell() }
            let title = "\(shownCurrencyNameString)"
            let price = "\(currencyPrice)"

            currencySettingTableCell.setCurrencyCellData(title: title, price: price)
            currencySettingTableCell.setStarButton(key: currencyButtonKey)

            // 검색 중이지 않을 경우
        } else {
            let title = "\(currencyNameString[indexPath.row])"
            let price = "\(currencyPrice)"
            currencySettingTableCell.setCurrencyCellData(title: title, price: price)
            currencySettingTableCell.setStarButton(key: currencyButtonKey)
        }
        return currencySettingTableCell
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
    func searchBar(_: UISearchBar, textDidChange changedText: String) {
        if self.mainView.searchBar.text?.trimmingCharacters(in: .whitespaces).isEmpty == true {
            self.isSearched = false
            self.mainView.currencyTableView.reloadData()
        } else {
            self.isSearched = true
            self.shownCurrencyNameString = self.currencyNameString?.filter {
                $0.uppercased().hasPrefix(changedText.uppercased())
            }
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
