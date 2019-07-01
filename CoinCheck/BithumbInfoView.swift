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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addSubviews() {
        addSubview(bithumbTableView)
    }
    
    func addConstraints() {
        self.bithumbTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bithumbTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            bithumbTableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            bithumbTableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            bithumbTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
    }
}
