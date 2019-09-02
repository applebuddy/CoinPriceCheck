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

    var selectedExchangeIndex: Int
    var currencyCount: Int
    var tradeData: TradeDataResponse?

    init() {
        self.currencyCount = 0
        self.selectedExchangeIndex = 0
    }
}
