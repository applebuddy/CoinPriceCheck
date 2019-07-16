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
    var isSearched: Bool = false
    
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
        self.setCellData()
        self.setSearchBar()
    }
    
    override func viewDidAppear(_: Bool) {
        super.viewDidAppear(true)
    }
    
    // MARK: - Setting Methods
    
    func setSearchBar() {
        guard let currencyNameString = self.currencyNameString else { return }
        self.mainView.searchBar
            .rx.text
            .orEmpty
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
            self.setBithumbData()
        }
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
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Type '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("Unable to parse JSON : \(error.localizedDescription)")
        }
    }
    
    func checkCurrencyIndex(_ imageView: UIImageView){
        let selectedIndex = imageView.tag - 100
        if isSearched == false {
            guard let nowCurrencyString = self.currencyNameString else { return }
            print("\(selectedIndex): \(nowCurrencyString[selectedIndex])")
        } else {
            guard let shownCurrencyString = self.shownCurrencyNameString else { return }
            print("\(selectedIndex): \(shownCurrencyString[selectedIndex])")
        }
    }
    
    @objc func cellStarImageViewPressed(_ sender: UITapGestureRecognizer){
        guard let selectedCellStarView = sender.view as? UIImageView else { return }
        // 클릭한 셀의 암호화폐 정보를 즐겨찾기 설정한다.
        
        // issue) 전체 암호화폐 정보 셋팅 유무를 싱글턴으로 관리해서 셋팅 된 것만 메인에 뿌려주도록 한다.
//        if selectedCellStarView.image == #imageLiteral(resourceName: "star") {
//            selectedCellStarView.image = #imageLiteral(resourceName: "star_")
//        } else {
//            selectedCellStarView.image = #imageLiteral(resourceName: "star")
//        }
        
        checkCurrencyIndex(selectedCellStarView)
    }
}

extension CurrencyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let bithumbTableViewCell = tableView.dequeueReusableCell(withIdentifier: bithumbTableViewCellIdentifier, for: indexPath) as? CurrencyTableViewCell,
            let currencyPrice = CommonData.shared.tradeData?.data.arr[indexPath.row].closingPrice else { return UITableViewCell() }
        
        let currencyNameString = BithumbCurrencies.bithumbCurrencyNameString
        if self.isSearched == true {
            guard let shownCurrencyNameString = self.shownCurrencyNameString else { return UITableViewCell() }
            bithumbTableViewCell.titleLabel.text = "\(shownCurrencyNameString[indexPath.row])/KRW"
            bithumbTableViewCell.priceLabel.text = "\(currencyPrice)원"
        } else {
            bithumbTableViewCell.titleLabel.text = "\(currencyNameString[indexPath.row])/KRW"
            bithumbTableViewCell.priceLabel.text = "\(currencyPrice)원"
        }
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cellStarImageViewPressed(_:)))
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
