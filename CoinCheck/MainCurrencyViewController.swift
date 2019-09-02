//
//  ViewController.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 23/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class MainCurrencyViewController: UIViewController {
    // MARK: - Properties

    var settingCurrencyData: [String: CurrencyDataResponse] = [:]
    var settingCurrencyIndex: [String] = []

    // MARK: - UIs

    let mainCurrencyView: MainCurrencyView = {
        let mainView = MainCurrencyView()
        return mainView
    }()

    var checkTimer: Timer = {
        let checkTimer = Timer()
        return checkTimer
    }()

    let addBarButton: UIButton = {
        let addBarButton = UIButton(type: .custom)
        addBarButton.setTitle("＋", for: .normal)
        addBarButton.setTitleColor(UIColor.navigationBarTitle, for: .normal)
        addBarButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        addBarButton.titleLabel?.font = UIFont().mainFont(size: 30)
        addBarButton.isUserInteractionEnabled = true
        return addBarButton
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.mainCurrencyView.mainCurrencyTableView.delegate = self
        self.mainCurrencyView.mainCurrencyTableView.dataSource = self
        self.mainCurrencyView.mainCurrencyTableView.allowsSelection = false
        self.registerCell()
        self.setCellIndexData()
        self.setBithumbData()
        self.setBarButtonItem()

        self.checkTimer = Timer.scheduledTimer(timeInterval: 6.0, target: self, selector: #selector(refreshBithumbData(_:)), userInfo: nil, repeats: true)
    }

    override func viewWillAppear(_: Bool) {
        super.viewWillAppear(true)
        self.setCellIndexData()
        self.setBithumbData()
    }

    override func loadView() {
        super.loadView()
        self.view = self.mainCurrencyView
    }

    // MARK: - Setting Methods

    func setCellIndexData() {
        BithumbCurrencies.shared.setCurrencyData()
        let currencyKey = BithumbCurrencies.shared.settingCurrencyKey.sorted { (arg0, arg1) -> Bool in
            if arg0.value > arg1.value {
                return false
            } else {
                return true
            }
        }

        self.settingCurrencyIndex = []
        for (key, _) in currencyKey {
            self.settingCurrencyIndex.append(key)
        }

        DispatchQueue.main.async {
            self.mainCurrencyView.mainCurrencyTableView.reloadData()
        }
    }

    func setBarButtonItem() {
        self.addBarButton.addTarget(self, action: #selector(self.transitionToNextView(_:)), for: UIControl.Event.touchUpInside)
        let addBarButtonItem = UIBarButtonItem(customView: addBarButton)
        self.navigationItem.rightBarButtonItem = addBarButtonItem
    }

    // MARKL- Touch Event Methodds
    @objc func transitionToNextView(_: UIButton) {
        let settingViewController = ExchangeSettingViewController()
        self.navigationController?.pushViewController(settingViewController, animated: true)
    }
}

// MARK: - Networking Extension

extension MainCurrencyViewController {
    func setBithumbData() {
        let settingCurrencyKey = BithumbCurrencies.shared.settingCurrencyKey
        for (key, _) in settingCurrencyKey {
            let urlString: String = "https://api.bithumb.com/public/ticker/\(key)"
            RequestAPI.requestCurrencyData(urlString: urlString) { currencyData in
                self.settingCurrencyData[key] = currencyData
                self.mainCurrencyView.mainCurrencyTableView.reloadData()
            }
        }
    }

    @objc func refreshBithumbData(_: Timer) {
        let settingCurrencyKey = BithumbCurrencies.shared.settingCurrencyKey
        for (key, _) in settingCurrencyKey {
            let urlString: String = "https://api.bithumb.com/public/ticker/\(key)"
            RequestAPI.requestCurrencyData(urlString: urlString) { currencyData in
                self.settingCurrencyData[key] = currencyData
                self.mainCurrencyView.mainCurrencyTableView.reloadData()
            }
        }
    }
}

extension MainCurrencyViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return BithumbCurrencies.shared.settingCurrencyKey.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currencyTitle = self.settingCurrencyIndex[indexPath.row]
        let currencyData = self.settingCurrencyData[currencyTitle]

        guard let mainCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.mainTableViewCellIdentifier, for: indexPath) as? MainCurrencyTableViewCell,
            let closingPrice = currencyData?.data.closingPrice,
            let risingRate = currencyData?.data.fluctateRate24H else { return UITableViewCell() }

        mainCell.setMainCellData(title: currencyTitle, price: closingPrice, risingRate: risingRate)
        return mainCell
    }
}

extension MainCurrencyViewController: UITableViewDelegate {
    func tableView(_: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let nowSection = MainCurrencyTableViewSections(rawValue: section) else { return UIView() }
        switch nowSection {
        case .mainSection: return MainTableHeaderView()
        }
    }

    func tableView(_: UITableView, heightForHeaderInSection _: Int) -> CGFloat {
        return ViewSize.cellHeaderHeight
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension MainCurrencyViewController: UITableViewCellSettingProtocol {
    func registerCell() {
        self.mainCurrencyView.mainCurrencyTableView.register(MainCurrencyTableViewCell.self, forCellReuseIdentifier: CellIdentifier.mainTableViewCellIdentifier)
    }
}
