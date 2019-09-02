//
//  MainHeaderView.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 26/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class ExchangeSettingTableViewCell: UITableViewCell {
    // MARK: - UIs

    private let titleImageView: UIImageView = {
        let titleImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        titleImageView.backgroundColor = #colorLiteral(red: 0.5514791608, green: 0.6702116728, blue: 0.2510133386, alpha: 1)
        titleImageView.alpha = 0.7
        return titleImageView
    }()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "항목"
        titleLabel.textColor = UIColor.cellText
        return titleLabel
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

    private func setTitleImageViewContraint() {
        self.titleImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: ViewData.Insets.leftInset),
            titleImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 0),
            titleImageView.widthAnchor.constraint(equalToConstant: 60),
            titleImageView.heightAnchor.constraint(equalTo: titleImageView.widthAnchor, multiplier: 1.0),
            titleImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            titleImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }

    private func setTitleLabelConstraint() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: titleImageView.rightAnchor, constant: ViewData.Insets.leftInset / 2),
            titleLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 60),
            titleLabel.topAnchor.constraint(equalTo: titleImageView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleImageView.bottomAnchor),
        ])
    }

    func setExchangeCellData(title: String) {
        self.titleLabel.text = title
    }
}

extension ExchangeSettingTableViewCell: UIViewSettingProtocol {
    func setConstraint() {
        self.setTitleImageViewContraint()
        self.setTitleLabelConstraint()
    }

    func setSubView() {
        addSubview(self.titleLabel)
        addSubview(self.titleImageView)
    }
}
