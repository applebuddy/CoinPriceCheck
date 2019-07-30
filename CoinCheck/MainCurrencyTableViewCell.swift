//
//  MainTableViewCell.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 23/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

internal class MainCurrencyTableViewCell: UITableViewCell {
    // MARK: - UIs

    let titleImageView: UIImageView = {
        let titleImageView = UIImageView()
        titleImageView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return titleImageView
    }()

    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.cellText
        return titleLabel
    }()

    let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textColor = UIColor.cellText
        priceLabel.font = UIFont.boldSystemFont(ofSize: 23)
        return priceLabel
    }()

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setSubView()
        self.setConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Set Method

    func setMainCellData(title: String, price: String) {
        self.titleLabel.text = title
        self.priceLabel.text = price
    }

    func setTitleImageViewContraint() {
        self.titleImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: ViewInsets.leftInset),
            titleImageView.widthAnchor.constraint(equalToConstant: 60),
            titleImageView.heightAnchor.constraint(equalTo: titleImageView.widthAnchor, constant: 0),
            titleImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
        ])
    }

    func setTitleLabelConstraint() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: titleImageView.rightAnchor, constant: ViewInsets.leftInset / 2),
            titleLabel.topAnchor.constraint(equalTo: titleImageView.topAnchor, constant: 0),
            titleLabel.bottomAnchor.constraint(equalTo: titleImageView.centerYAnchor, constant: 0),
        ])
    }

    func setPriceLabelConstraint() {
        self.priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 0),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            priceLabel.bottomAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 0),
        ])
    }
}

extension MainCurrencyTableViewCell: UIViewSettingProtocol {
    func setConstraint() {
        self.setTitleImageViewContraint()
        self.setTitleLabelConstraint()
        self.setPriceLabelConstraint()
    }

    func setSubView() {
        addSubview(self.priceLabel)
        addSubview(self.titleLabel)
        addSubview(self.titleImageView)
    }
}
