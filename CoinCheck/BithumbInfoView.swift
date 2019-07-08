//
//  BithumbInfoView.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 01/07/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class BithumbInfoView: UIView {
    let bithumbTableView: UITableView = {
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        self.addConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func addSubviews() {
        addSubview(self.bithumbTableView)
        addSubview(self.searchBar)
    }

    func addConstraints() {
        self.searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            searchBar.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            searchBar.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
        ])

        self.bithumbTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bithumbTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            bithumbTableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            bithumbTableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            bithumbTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
