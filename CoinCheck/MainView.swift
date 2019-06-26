//
//  MainView.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 23/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    let mainTableView: UITableView = {
        let mainTableView = UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)
        mainTableView.backgroundColor = UIColor.tableViewBackground
        return mainTableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setMainViewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK:- Setting Methods
    func setMainViewConstraints() {
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainTableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            mainTableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    func setSubviews() {
        addSubview(mainTableView)
    }
    
}
