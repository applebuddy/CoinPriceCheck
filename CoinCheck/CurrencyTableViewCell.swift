//
//  BithumbTableViewCell.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 01/07/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

protocol CurrencyTableViewCellDelegate {
    func starButtonPressed(index: Int, _ sender: UIButton)
}

class CurrencyTableViewCell: UITableViewCell {
    var setCode: Int = 0
    var index: Int = 0
    var delegate: CurrencyTableViewCellDelegate?

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

    let starButton: UIButton = {
        let starButton = UIButton(type: .custom)
        starButton.isUserInteractionEnabled = true
        return starButton
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubviews()
        self.addContraints()
        self.starButton.addTarget(self, action: #selector(self.starButtonPressed(_:)), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func addSubviews() {
        addSubview(self.titleImageView)
        addSubview(self.titleLabel)
        addSubview(self.priceLabel)
        addSubview(self.starButton)
    }

    func addContraints() {
        self.starButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            starButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            starButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -ViewInsets.rightInset),
            starButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3),
            starButton.widthAnchor.constraint(equalTo: starButton.heightAnchor),
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
            titleLabel.rightAnchor.constraint(equalTo: starButton.rightAnchor, constant: -ViewInsets.rightInset),
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

    func setCellIndex(cellIndex: Int) {
        self.index = cellIndex
    }

    @objc func starButtonPressed(_ sender: UIButton) {
        self.delegate?.starButtonPressed(index: self.index, sender)
        guard let currencyKey = self.titleLabel.text else { return }
        let key = currencyKey.components(separatedBy: "/KRW")[0]
        print("\(key)")

        if BithumbCurrencies.shared.currencyKey[key] == 0 {
            BithumbCurrencies.shared.settingCurrencyCount += 1
            BithumbCurrencies.shared.currencyKey[key] = 1 // starButton 터치상태 확인하는 데 사용하는 딕셔너리 값
            BithumbCurrencies.shared.settingCurrencyKey[key] = BithumbCurrencies.shared.settingCurrencyCount
        } else {
            BithumbCurrencies.shared.settingCurrencyCount -= 1
            BithumbCurrencies.shared.currencyKey[key] = 0
            BithumbCurrencies.shared.settingCurrencyKey.removeValue(forKey: key)
            print(BithumbCurrencies.shared.settingCurrencyKey)
        }
    }
}
