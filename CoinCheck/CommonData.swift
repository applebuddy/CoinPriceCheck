//
//  CommonData.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 23/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

final class CommonData {
    static let shared: CommonData = CommonData()
    // 셋팅한 암호화폐의 거래소코드:암호화폐명 정보를 담는다.
//    var currencyList: [Int: String]
    var selectedExchangeIndex: Int
    var currencyCount: Int
    var tradeData: TradeResponse?

    init() {
//        self.currencyList = [:]
        self.currencyCount = 0
        self.selectedExchangeIndex = 0
    }
}

struct ViewTag {
    static let starImageViewTag = 100
}

struct ViewInsets {
    static let leftInset: CGFloat = 16
    static let rightInset: CGFloat = 16
    static let topInset: CGFloat = 8
    static let bottomInset: CGFloat = 8
}

struct ViewSize {
    static let titleWidth: CGFloat = 100
    static let cellTextWidth: CGFloat = 60
    static let cellHeaderHeight: CGFloat = 60
    static let cellDefaultHeight: CGFloat = 100
}

struct CellIdentifier {
    static let bithumbTableViewCellIdentifier: String = "bithumbTableViewCell"
    static let mainTableViewCellIdentifier: String = "mainTableViewCell"
}

struct DataIdentifier {
    static let bithumbSettingCurrencyKey: String = "BithumbSettingCurrencyKey"
    static let bithumbCurrencyKey: String = "BithumbCurrencyKey"
}
