//
//  BithumbTableViewCell.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 01/07/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class BithumbTableViewCell: UITableViewCell {
    let titleImageView: UIImageView = {
        let titleImageView = UIImageView()
        titleImageView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return titleImageView
    }()

    let titleLabel: UILabel = {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        return titleLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubviews()
        self.addContraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func addSubviews() {
        addSubview(self.titleImageView)
        addSubview(self.titleLabel)
    }

    func addContraints() {
        self.titleImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            titleImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: ViewInsets.leftInset),
            titleImageView.heightAnchor.constraint(equalToConstant: 70),
            titleImageView.widthAnchor.constraint(equalTo: titleImageView.heightAnchor, multiplier: 1.0),
        ])

        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: titleImageView.rightAnchor, constant: ViewInsets.leftInset / 2),
            titleLabel.topAnchor.constraint(equalTo: titleImageView.topAnchor),
        ])
    }
}
