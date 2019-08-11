//
//  MainNavigationController.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 23/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

internal class MainNavigationCnotroller: UINavigationController {
    // MARK: - UIs

    let settingViewController: SettingExchangeViewController = {
        let settingViewController = SettingExchangeViewController()
        return settingViewController
    }()

    // MARK: - Initialization

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.setNavigationBar()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Set Method

    func setNavigationBar() {
        self.navigationBar.topItem?.title = "Coin Price Check"
        self.navigationBar.barTintColor = UIColor.navigationBarButtonItemBackground
        self.navigationBar.barStyle = .blackTranslucent
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(self.transitionToSelectView(_:)))
    }

    // MARK: - Events

    @objc func transitionToSelectView(_: UIBarButtonItem) {}
}
