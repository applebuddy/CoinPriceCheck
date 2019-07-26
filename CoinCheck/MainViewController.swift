//
//  ViewController.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 23/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

enum MainTableViewSections: Int {
    case mainSection = 0
}

class MainViewController: UIViewController {
    let mainTableViewCellIdentifier = "mainTableViewCell"
    var settingCurrencyData: [String: CurrencyDataResponse] = [:]
    var settingCurrencyIndex: [String] = []

    let mainView: MainView = {
        let mainView = MainView()
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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.mainView.mainTableView.delegate = self
        self.mainView.mainTableView.dataSource = self
        self.mainView.mainTableView.allowsSelection = false
        self.registerCell()
        self.setBarButtonItem()
        self.setBithumbData()
        self.setCellIndexData()
        self.checkTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(refreshBithumbData(_:)), userInfo: nil, repeats: true)
    }

    override func viewWillAppear(_: Bool) {
        super.viewWillAppear(true)
        self.setBithumbData()
        self.setCellIndexData()
    }

    override func loadView() {
        super.loadView()
        self.view = self.mainView
    }

    // MARK: - Setting Methods

    func registerCell() {
        self.mainView.mainTableView.register(MainCurrencyTableViewCell.self, forCellReuseIdentifier: self.mainTableViewCellIdentifier)
    }

    func setCellIndexData() {
        let currencyKey = BithumbCurrencies.shared.settingCurrencyKey
        self.settingCurrencyIndex = []
        for (key, _) in currencyKey {
            self.settingCurrencyIndex.append(key)
        }
        print("?? : \(self.settingCurrencyIndex)")
    }

    func setBarButtonItem() {
        self.addBarButton.addTarget(self, action: #selector(self.transitionToNextView(_:)), for: UIControl.Event.touchUpInside)
        let addBarButtonItem = UIBarButtonItem(customView: addBarButton)
        self.navigationItem.rightBarButtonItem = addBarButtonItem
    }

    // MARKL- Touch Event Methodds
    @objc func transitionToNextView(_: UIButton) {
        let settingViewController = SettingExchangeViewController()
        self.navigationController?.pushViewController(settingViewController, animated: true)
    }
}

// MARK: - Networking Extension

extension MainViewController {
    func setBithumbData() {
        // "https://api.bithumb.com/public/orderbook/ALL"
        // "https://api.bithumb.com/public/ticker/ALL"
        let settingCurrencyKey = BithumbCurrencies.shared.settingCurrencyKey
        for (key, _) in settingCurrencyKey {
            let urlString: String = "https://api.bithumb.com/public/ticker/\(key)"
            RequestAPI.requestCurrencyData(urlString: urlString) { currencyData in
                print("데이터체크 : \(currencyData.data)")
                self.settingCurrencyData[key] = currencyData
            }
        }
        self.mainView.mainTableView.reloadData()
    }

    @objc func refreshBithumbData(_: Timer) {
        let settingCurrencyKey = BithumbCurrencies.shared.settingCurrencyKey
        for (key, _) in settingCurrencyKey {
            let urlString: String = "https://api.bithumb.com/public/ticker/\(key)"
            RequestAPI.requestCurrencyData(urlString: urlString) { currencyData in
                print("데이터체크 : \(currencyData.data)")
                self.settingCurrencyData[key] = currencyData
            }
        }
        self.mainView.mainTableView.reloadData()
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return BithumbCurrencies.shared.settingCurrencyKey.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let mainCell = tableView.dequeueReusableCell(withIdentifier: self.mainTableViewCellIdentifier, for: indexPath) as? MainCurrencyTableViewCell else { return UITableViewCell() }
        let currencyKey = self.settingCurrencyIndex[indexPath.row]
        let currencyData = self.settingCurrencyData[currencyKey]
        mainCell.titleLabel.text = currencyKey
        mainCell.priceLabel.text = currencyData?.data.closingPrice ?? "-"
        return mainCell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let nowSection = MainTableViewSections(rawValue: section) else { return UIView() }
        switch nowSection {
        case .mainSection: return MainTableHeaderView()
        }
    }

    func tableView(_: UITableView, heightForHeaderInSection _: Int) -> CGFloat {
        return ViewSize.cellHeaderHeight
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return ViewSize.cellDefaultHeight
    }
}
