//
//  MainTableViewCell.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 23/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return priceLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(priceLabel)
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setConstraints() {
        self.priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            priceLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 0),
            priceLabel.widthAnchor.constraint(equalToConstant: 50)
            ])
    }
}
