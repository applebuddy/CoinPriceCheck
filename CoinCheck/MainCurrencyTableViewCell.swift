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
        titleLabel.textColor = .cellText
        return titleLabel
    }()

    let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textColor = .cellText
        priceLabel.font = .boldSystemFont(ofSize: 23)
        return priceLabel
    }()

    let priceRisingRateLabel: UILabel = {
        let priceRisingRateLabel = UILabel()
        priceRisingRateLabel.textColor = .cellText
        priceRisingRateLabel.font = .systemFont(ofSize: 16)
        return priceRisingRateLabel
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

    func setMainCellData(title: String, price: String, risingRate: String) {
        self.titleLabel.text = "\(title)/KRW"
        self.priceLabel.text = price
        self.setRisingRateLabel(rate: risingRate)
    }

    func setRisingRateLabel(rate: String) {
        let rateHeadString = Array(rate)[0]
        if rateHeadString == "-" {
            self.priceRisingRateLabel.textColor = .blue
            self.priceRisingRateLabel.text = "\(rate)▼"
        } else {
            self.priceRisingRateLabel.textColor = .red
            self.priceRisingRateLabel.text = "\(rate)▲"
        }
    }

    func setTitleImageViewContraint() {
        self.titleImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: ViewInsets.leftInset),
            titleImageView.widthAnchor.constraint(equalToConstant: 60),
            titleImageView.heightAnchor.constraint(equalTo: titleImageView.widthAnchor, constant: 0),
            titleImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleImageView.topAnchor.constraint(equalTo: topAnchor, constant: ViewInsets.topInset),
            titleImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -ViewInsets.bottomInset),
        ])
    }

    func setTitleLabelConstraint() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: titleImageView.rightAnchor, constant: ViewInsets.leftInset / 2),
            titleLabel.topAnchor.constraint(equalTo: titleImageView.topAnchor, constant: 0),
            titleLabel.heightAnchor.constraint(equalTo: titleImageView.heightAnchor, multiplier: 0.5),
            titleLabel.widthAnchor.constraint(equalToConstant: 80),
        ])
    }

    func setPriceLabelConstraint() {
        self.priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 0),
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            priceLabel.bottomAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 0),
            priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -ViewInsets.rightInset),
        ])
    }

    func setPriceRisingRateLabelConstraint() {
        self.priceRisingRateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceRisingRateLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor),
            priceRisingRateLabel.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: ViewInsets.leftInset / 2),
            priceRisingRateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -ViewInsets.rightInset),
            priceRisingRateLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
        ])
    }
}

extension MainCurrencyTableViewCell: UIViewSettingProtocol {
    func setConstraint() {
        self.setTitleImageViewContraint()
        self.setTitleLabelConstraint()
        self.setPriceLabelConstraint()
        self.setPriceRisingRateLabelConstraint()
    }

    func setSubView() {
        addSubview(self.priceLabel)
        addSubview(self.titleLabel)
        addSubview(self.titleImageView)
        addSubview(self.priceRisingRateLabel)
    }
}
