//
//  MainNavigationController.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 23/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class MainNavigationCnotroller:  UINavigationController {
    
    let settingViewController: SettingViewController = {
        let settingViewController = SettingViewController()
        return settingViewController
    }()
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        setNavigationBar()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

    func setNavigationBar() {
        self.navigationBar.topItem?.title = "^-^"
        self.navigationBar.barTintColor = UIColor.navigationBarButtonItemBackground
        self.navigationBar.barStyle = .blackTranslucent
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(transitionToSelectView(_:)))
    }
    @objc func transitionToSelectView(_ sender: UIBarButtonItem) {
        
    }
}
