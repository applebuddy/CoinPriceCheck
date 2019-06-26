//
//  MainHeaderView.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 26/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "항목"
        titleLabel.textColor = UIColor.cellText
        return titleLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubviews()
        self.setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addSubviews() {
        addSubview(titleLabel)
    }
    
    func setConstraints() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: ViewInsets.leftInset),
            titleLabel.widthAnchor.constraint(equalToConstant: ViewSize.cellTextWidth)
            ])
    }
    
}
