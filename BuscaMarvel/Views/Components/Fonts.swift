//
//  Styles.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 02/02/21.
//

import UIKit

enum Fonts: String {
    case RobotoBlack = "Roboto-Black"
    case RobotoRegular = "Roboto-Regular"
    case RobotoLight = "Roboto-Light"
}

class AppFonts {
    static let Title = UIFont(name: Fonts.RobotoBlack.rawValue, size: 18)
    static let Subtitle = UIFont(name: Fonts.RobotoLight.rawValue, size: 18)
    static let Label = UIFont(name: Fonts.RobotoRegular.rawValue, size: 18)
}
