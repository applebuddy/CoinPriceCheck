//
//  SettingViewController.swift
//  CoinCheck
//
//  Created by Min Kyeong Tae on 23/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ㅠ_ㅠ"
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = MainView()
    }
}
