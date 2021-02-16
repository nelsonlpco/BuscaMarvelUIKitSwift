//
//  Title.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 21/02/21.
//

import UIKit

class Title: UILabel{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.font = UIFont(name: Fonts.RobotoBlack.rawValue, size: 18)
        self.textColor = .red
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
