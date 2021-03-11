//
//  NumericPageControlModel.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 07/03/21.
//

import Foundation

class NumericPageControlModel: NSObject{
    //MARK: - Properties
    private var totalDots: Int = 0
    private var dotIndex: Int = 0
    private var currentPage: Int = 0
    private var totalPages: Int = 0
    var rightArrowIsActive: Bool = false
    var leftArrowIsActive: Bool = false
    var dots: [DotModel] = []
    
    
    //MARK: - Initializers
    init(dots: Int, totalPages: Int) {
        super.init()
        
        self.totalPages = totalPages
        setTotalDots(dots)
        setCurrentPage(0)
    }
    
    //MARK: - Actions
    func setTotalDots(_ total: Int) {
        totalDots = total
        makeDots(totalDots)
    }
    
    func activeDot(byIndex dotIndex: Int){
        for index in 0..<dots.count {
            dots[index].isActive = index == dotIndex
        }
    }
    
    func validateArrowLeft() {
        if currentPage < totalPages {
            leftArrowIsActive = true
        }
        else {
            leftArrowIsActive = false
        }
    }
    
    func validateArrowRight() {
        if currentPage > 0 {
            rightArrowIsActive = true
        } else {
            rightArrowIsActive = false
        }
    }
    
    func setCurrentPage(_ page: Int) {
        print("currento dot \(page)")
        self.currentPage = page
        validateArrowLeft()
        validateArrowRight()
        setDot()
    }
    
    private func makeDots(_ total: Int) {
        dots = [];
        for index in 0..<total {
            dots.append(DotModel(label: String(index+1), tag: index))
        }
    }
    
    func nextPage() {
        if leftArrowIsActive {
            incrementDots()
            setCurrentPage(currentPage + 1)
            
        }
    }
    
    func backPage() {
        if rightArrowIsActive {
            decrementDots()
            setCurrentPage(currentPage - 1)
            
        }
    }
    
    private func setDot() {
        let activeDotIndex =  dots.lastIndex {
            (dot) in
            dot.tag == currentPage
        }
        
        guard let index = activeDotIndex else { return }
        dotIndex = index
        self.activeDot(byIndex: dotIndex)
    }
    
    private func incrementDots() {
        if dotIndex < totalDots-1 {
            return
        }
        
        for index in 0..<dots.count {
            dots[index].tag += 1
            dots[index].label = String(dots[index].tag + 1)
        }
    }
    
    private func decrementDots() {
        if dotIndex > 0 {
            return
        }
        
        for index in 0..<dots.count {
            dots[index].tag -= 1
            dots[index].label = String(dots[index].tag + 1)
        }
    }
}
