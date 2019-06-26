//
//  ViewController.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 23/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

enum MainTableViewSections: Int {
    case mainSection = 0
}

class MainViewController: UIViewController {

    let mainTableViewCellIdentifier = "mainTableViewCell"
    let mainView: MainView = {
        let mainView = MainView()
        return mainView
    }()
    
    let addBarButton: UIButton = {
        let addBarButton = UIButton(type: .custom)
        addBarButton.setTitle("＋", for: .normal)
        addBarButton.setTitleColor(UIColor.navigationBarTitle, for: .normal)
        addBarButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        addBarButton.titleLabel?.font = UIFont().mainFont(size: 30)
        addBarButton.isUserInteractionEnabled = true
        return addBarButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.mainView.mainTableView.delegate = self
        self.mainView.mainTableView.dataSource = self
        registerCell()
        setBarButtonItem()
    }

    override func loadView() {
        super.loadView()
        self.view = self.mainView
    }

    // MARK:- Setting Methods
    func registerCell() {
        self.mainView.mainTableView.register(MainTableViewCell.self, forCellReuseIdentifier: mainTableViewCellIdentifier)
    }
    
    func setBarButtonItem() {
        addBarButton.addTarget(self, action: #selector(transitionToNextView(_:)), for: UIControl.Event.touchUpInside)
        let addBarButtonItem = UIBarButtonItem(customView: addBarButton)
        self.navigationItem.rightBarButtonItem = addBarButtonItem
    }
    
    // MARKL- Touch Event Methodds
    @objc func transitionToNextView(_ sender: UIButton) {
        print("???")
        let settingViewController = SettingViewController()
        self.navigationController?.pushViewController(settingViewController, animated: true)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let mainCell = tableView.dequeueReusableCell(withIdentifier: self.mainTableViewCellIdentifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        mainCell.priceLabel.text = "???"
        return mainCell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let nowSection = MainTableViewSections(rawValue: section) else { return UIView() }
        switch nowSection {
        case .mainSection: return MainTableHeaderView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return ViewSize.cellHeaderHeight
    }
}
