//
//  DotModel.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 10/03/21.
//

import Foundation

struct DotModel {
    var label: String
    var tag: Int
    var isActive: Bool
    
    init(label: String, tag: Int, isActive: Bool = false) {
        self.label = label
        self.isActive = isActive
        self.tag = tag
    }
}
