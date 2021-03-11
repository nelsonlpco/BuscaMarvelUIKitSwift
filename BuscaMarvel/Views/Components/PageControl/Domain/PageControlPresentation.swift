//
//  PageControllPresentation.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 07/03/21.
//

import Foundation

protocol PageControlPresentation {
    func setTotalDots(_ total: Int)
    
    func setCurrentPage(_ page: Int)
    
    func nextPage()
    
    func backPage()
}
