//
//  CommonData.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 23/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

struct ViewInsets {
    static let leftInset: CGFloat = 16
    static let rightInset: CGFloat = 16
}

struct ViewSize {
    static let titleWidth: CGFloat = 100
    static let cellTextWidth: CGFloat = 60
    static let cellHeaderHeight: CGFloat = 60
}

let alert = UIAlertController(title: "dqwd", message: "qww", preferredStyle: UIAlertController.Style.alert)


extension UIFont {
    func mainFont(size: CGFloat) -> UIFont {
        guard let mainFont = UIFont(name: "HelveticaNeue-Thin", size: size) else { return UIFont() }
        return mainFont
    }
}

extension UIColor {
    static let navigationBarButtonItemBackground = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    static let navigationBarTitle = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static let headerTitle = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let tableViewBackground = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static let cellHeaderBackground = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    static let cellText = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
}

class CommonData {
    static let shared: CommonData = CommonData()
    var tradeData: TradeResponse?
    var currencyList: [String]
    var currencyCount: Int
    
    init() {
        currencyList = []
        currencyCount = 0
    }
    
//    //Type 'TradeData?' does not conform to protocol 'Sequence' 애러가 뜬다 어떻게 해야할까?
//    func getCurrencyCount() -> Int {
//        for child in tradeData?.data {
//
//        }
//    }
}
