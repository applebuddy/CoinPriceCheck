//
//  BithumbTableViewCell.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 01/07/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    var setCode: Int = 0

    let titleImageView: UIImageView = {
        let titleImageView = UIImageView()
        titleImageView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return titleImageView
    }()

    let titleLabel: UILabel = {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        titleLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return titleLabel
    }()

    let priceLabel: UILabel = {
        let priceLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        priceLabel.font = UIFont.boldSystemFont(ofSize: 23)
        return priceLabel
    }()

    let starImageView: UIImageView = {
        let starImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        starImageView.isUserInteractionEnabled = false
        starImageView.image = #imageLiteral(resourceName: "star")
        return starImageView
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
        addSubview(self.priceLabel)
        addSubview(self.starImageView)
    }

    func addContraints() {
        self.starImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            starImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            starImageView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -ViewInsets.rightInset),
            starImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3),
            starImageView.widthAnchor.constraint(equalTo: starImageView.heightAnchor),
        ])

        self.titleImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            titleImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: ViewInsets.leftInset),
            titleImageView.heightAnchor.constraint(equalToConstant: 60),
            titleImageView.widthAnchor.constraint(equalTo: titleImageView.heightAnchor, multiplier: 1.0),
        ])

        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: titleImageView.rightAnchor, constant: ViewInsets.leftInset / 2),
            titleLabel.topAnchor.constraint(equalTo: titleImageView.topAnchor),
            titleLabel.rightAnchor.constraint(equalTo: starImageView.rightAnchor, constant: -ViewInsets.rightInset),
            titleLabel.bottomAnchor.constraint(equalTo: titleImageView.centerYAnchor),
        ])

        self.priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: titleImageView.bottomAnchor),
            priceLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 0),
            priceLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -ViewInsets.rightInset),
        ])
    }
}
