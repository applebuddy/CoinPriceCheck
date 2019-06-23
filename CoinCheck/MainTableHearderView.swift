//
//  MainTableHearderView.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 23/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class MainTableHeaderView: UIView {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "메인 헤더"
        titleLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        addSubviews()
        setConstraints()
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
            titleLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 0),
            titleLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16)
            ])
    }
}
