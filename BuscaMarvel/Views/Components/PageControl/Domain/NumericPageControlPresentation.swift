//
//  NumericPageControllPresentation.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 07/03/21.
//

import Foundation

class NumericPageControlPresentation: PageControlPresentation {
    private let delegate: NumericPageControlDelegate!
    private let model: NumericPageControlModel!
        
    init(withDelegate delegate: NumericPageControlDelegate) {
        self.delegate = delegate
        model = NumericPageControlModel(dots: 0, totalPages: 100)
    }
    
    func setTotalDots(_ total: Int) {
        model.setTotalDots(total)
        delegate.makeDots(model.dots)
    }
    
    func setCurrentPage(_ page: Int) {
        model.setCurrentPage(page)
        updateScreen()
    }
    
    func nextPage() {
        model.nextPage()
        updateScreen()
    }
    
    func backPage() {
        model.backPage()
        updateScreen()
    }
    
    private func updateScreen() {
        delegate.updateDots(model.dots)
        delegate.updateLeftArrow(isActive: model.leftArrowIsActive)
        delegate.updateRightArrow(isActive: model.rightArrowIsActive)
    }
}
