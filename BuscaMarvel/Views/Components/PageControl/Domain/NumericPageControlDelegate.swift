//
//  NumericPageControlDelegate.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 07/03/21.
//

import Foundation

protocol NumericPageControlDelegate {
    func incrementDots()
    
    func decrementDots()
    
    func makeDots(_ dots: [DotModel])
    
    func updateDots(_ dots: [DotModel])
    
    func updateLeftArrow(isActive : Bool)
    
    func updateRightArrow(isActive : Bool)
}
