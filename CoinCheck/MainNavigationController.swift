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
        self.navigationBar.topItem?.title = "^-^"
        self.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.navigationBar.barStyle = .blackTranslucent
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(transitionToSelectView(_:)))
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func transitionToSelectView(_ sender: UIBarButtonItem) {
        
    }
}
