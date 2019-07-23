//
//  BithumbInfoViewController.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 01/07/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

enum BithumbTableViewSections: Int {
    case mainSection = 0
}

class CurrencyViewController: UIViewController {
    // MARK: - Properties

    let disposeBag = DisposeBag() // 뷰가 할당 해제될 때 놓아줄 수 있는 일회용품의 Rx 가방
    let bithumbTableViewCellIdentifier: String = "bithumbTableViewCellIdentifier"
    var currencyNameString: [String]?
    var shownCurrencyNameString: [String]?
    var nowIndexPath: IndexPath?
    var isSearched: Bool = false

    // MARK: Timer

    var checkTimer: Timer = {
        let checkTimer = Timer()
        return checkTimer
    }()

    // MARK: - UIs

    let mainView: BithumbInfoView = {
        let mainView = BithumbInfoView()
        return mainView
    }()

    // MARK: - ViewController App Cycle

    override func loadView() {
        super.loadView()
        view = self.mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.bithumbTableView.register(CurrencyTableViewCell.self, forCellReuseIdentifier: self.bithumbTableViewCellIdentifier)
        self.mainView.bithumbTableView.delegate = self
        self.mainView.bithumbTableView.dataSource = self
        self.mainView.searchBar.delegate = self
        self.mainView.bithumbTableView.allowsSelection = false
        self.setBithumbData()
        self.setCellData()
        self.setSearchBar()
        self.checkTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.refreshBithumbData(_:)), userInfo: nil, repeats: true)
    }

    override func viewDidAppear(_: Bool) {
        super.viewDidAppear(true)
    }

    // MARK: - Setting Methods

    func presentAlertViewController(errorString: String) {
        let alertController = UIAlertController(title: "문제가 발생하였습니다.", message: errorString, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }
    
    func setSearchBar() {
        guard let currencyNameString = self.currencyNameString else { return }
        self.mainView.searchBar
            .rx.text.orEmpty
            .debounce(RxTimeInterval.seconds(Int(0.3)), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter { !$0.isEmpty }
            .subscribe(onNext: { [weak self] query in
                self?.shownCurrencyNameString = currencyNameString.filter {
                    $0.uppercased().hasPrefix(query.uppercased())
                }
                self?.mainView.bithumbTableView.reloadData()
            })
            .disposed(by: self.disposeBag)
    }

    func setCellData() {
        guard let exchangeIndex = ExchangeIndex(rawValue: CommonData.shared.selectedExchangeIndex) else { return }
        switch exchangeIndex {
        case .bithumb:
            self.currencyNameString = BithumbCurrencies.bithumbCurrencyNameString
            navigationItem.title = "Bithumb 암호화폐 현항"
        }
    }

    @objc func refreshBithumbData(_: Timer) {
        self.setBithumbData()
        self.setCellData()
        self.mainView.bithumbTableView.reloadData()
    }

    func setBithumbData() {
        // "https://api.bithumb.com/public/orderbook/ALL"
        // "https://api.bithumb.com/public/ticker/ALL"
        let urlString: String = "https://api.bithumb.com/public/ticker/ALL"
        guard let url = URL(string: urlString) else { return }
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let contents = try Data(contentsOf: url)
            CommonData.shared.tradeData = try decoder.decode(TradeResponse.self, from: contents)
            // 데이터 처리하는 곳
        } catch let DecodingError.dataCorrupted(context) {
            presentAlertViewController(errorString: "\(context)")
        } catch let DecodingError.keyNotFound(key, context) {
            presentAlertViewController(errorString: "key: \(key), context: \(context)")
        } catch let DecodingError.valueNotFound(_, context) {
            presentAlertViewController(errorString: "\(context)")
        } catch DecodingError.typeMismatch(_, _) {
            presentAlertViewController(errorString: "Type Mismatched")
        } catch {
            presentAlertViewController(errorString: "\(error.localizedDescription)")
        }
    }

    func checkCurrencyIndex(_ imageView: UIImageView) { 
        let selectedIndex = imageView.tag - ViewTag.starImageViewTag
        if self.isSearched == false {
            guard let nowCurrencyString = self.currencyNameString else { return }
            fatalError("\(selectedIndex): \(nowCurrencyString[selectedIndex])")
        } else {
            guard let shownCurrencyString = self.shownCurrencyNameString else { return }
            fatalError("\(selectedIndex): \(shownCurrencyString[selectedIndex])")
        }
    }

    @objc func cellStarImageViewPressed(_ sender: UITapGestureRecognizer) {
        guard let selectedCellStarView = sender.view as? UIImageView,
            let nowIndexPath = mainView.bithumbTableView.indexPathForSelectedRow,
            let selectedCell = mainView.bithumbTableView.cellForRow(at: nowIndexPath) as? CurrencyTableViewCell,
            let selectedCellText = selectedCell.titleLabel.text else { return }

        if BithumbCurrencies.bithumbCurrencySetKey[selectedCellText] == 0 {
            BithumbCurrencies.bithumbCurrencySetKey.updateValue(1, forKey: selectedCellText)
        } else {
            BithumbCurrencies.bithumbCurrencySetKey.updateValue(0, forKey: selectedCellText)
        }

        self.checkCurrencyIndex(selectedCellStarView)
    }
}

extension CurrencyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let bithumbTableViewCell = tableView.dequeueReusableCell(withIdentifier: bithumbTableViewCellIdentifier, for: indexPath) as? CurrencyTableViewCell,
            let currencyPrice = CommonData.shared.tradeData?.data.arr[indexPath.row].closingPrice else { return UITableViewCell() }

        self.nowIndexPath = indexPath
        let currencyNameString = BithumbCurrencies.bithumbCurrencyNameString
        if self.isSearched == true {
            guard let shownCurrencyNameString = self.shownCurrencyNameString?[indexPath.row] else { return UITableViewCell() }
            bithumbTableViewCell.titleLabel.text = "\(shownCurrencyNameString)/KRW"
            bithumbTableViewCell.priceLabel.text = "\(currencyPrice)원"
            if BithumbCurrencies.bithumbCurrencySetKey[shownCurrencyNameString] == 0 {
                bithumbTableViewCell.starImageView.image = UIImage(named: "star")
            } else {
                bithumbTableViewCell.starImageView.image = UIImage(named: "star_set")
            }

        } else {
            bithumbTableViewCell.titleLabel.text = "\(currencyNameString[indexPath.row])/KRW"
            bithumbTableViewCell.priceLabel.text = "\(currencyPrice)원"
        }

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.cellStarImageViewPressed(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        bithumbTableViewCell.starImageView.tag = 100 + indexPath.row
        bithumbTableViewCell.starImageView.isUserInteractionEnabled = true
        bithumbTableViewCell.starImageView.addGestureRecognizer(tapGestureRecognizer)
        return bithumbTableViewCell
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionIndex = BithumbTableViewSections(rawValue: section) else { return 0 }
        let currencyNameString = BithumbCurrencies.bithumbCurrencyNameString

        if self.isSearched == true {
            let shownCurrencyNameString = self.shownCurrencyNameString
            switch sectionIndex {
            case .mainSection: return shownCurrencyNameString?.count ?? 0
            }
        } else {
            switch sectionIndex {
            case .mainSection: return currencyNameString.count
            }
        }
    }
}

extension CurrencyViewController: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 100
    }
}

extension CurrencyViewController: UISearchBarDelegate {
    func searchBar(_: UISearchBar, textDidChange _: String) {
        if self.mainView.searchBar.text?.trimmingCharacters(in: .whitespaces).isEmpty == true {
            self.isSearched = false
            self.mainView.bithumbTableView.reloadData()
        } else {
            self.isSearched = true
            self.mainView.bithumbTableView.reloadData()
        }
    }
}
