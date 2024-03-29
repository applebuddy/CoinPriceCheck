//
//  UIFont+.swift
//  CoinCheck
//
//  Created by MinKyeongTae on 02/09/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

extension UIFont {
    func mainFont(size: CGFloat) -> UIFont {
        guard let mainFont = UIFont(name: "HelveticaNeue-Thin", size: size) else { return UIFont() }
        return mainFont
    }
}
