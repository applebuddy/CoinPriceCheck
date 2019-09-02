//
//  BithumbInfoView.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 01/07/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class CurrencySettingView: UIView {
    // MARK: - UIs

    let currencyTableView: UITableView = {
        let bithumbTableView = UITableView(frame: CGRect(x: 0, y: 0, width: 20, height: 20), style: .plain)
        bithumbTableView.backgroundColor = UIColor.tableViewBackground
        return bithumbTableView
    }()

    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.textContentType = .name
        searchBar.autocapitalizationType = .none
        searchBar.spellCheckingType = .no
        searchBar.autocorrectionType = .no
        searchBar.keyboardType = .namePhonePad

        return searchBar
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setSubView()
        self.setConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK; - Set Method

    private func setSearchBarConstraint() {
        self.searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            searchBar.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            searchBar.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
        ])
    }

    private func setCurrencyTableViewConstraint() {
        self.currencyTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currencyTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            currencyTableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            currencyTableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            currencyTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension CurrencySettingView: UIViewSettingProtocol {
    func setConstraint() {
        self.setSearchBarConstraint()
        self.setCurrencyTableViewConstraint()
    }

    func setSubView() {
        addSubview(self.currencyTableView)
        addSubview(self.searchBar)
    }
}
