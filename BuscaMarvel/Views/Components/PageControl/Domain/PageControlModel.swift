//
//  PageControlModel.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 07/03/21.
//

import Foundation

class PageControllModel: NSObject{
    //MARK: - Properties
    private var totalPages: Int = 0
    private var currentDotIndex: Int = 0
    
    private var numberOfDots: Int = 0 {
        didSet {
            for tag in 0 ..< numberOfDots {
                dots.append(makeDot(tag))
            }
        }
    }
    
    public var currentPage: Int = 0 {
        didSet {
            if currentPage >= 1 && !self.rightArrow.isActive {
                self.rightArrow.active()
                self.rightArrow.setNeedsDisplay()
            }
            else if currentPage < 1 && self.rightArrow.isActive {
                self.rightArrow.desactive()
                self.rightArrow.setNeedsDisplay()
            }
            
            dots.forEach {
                dot in
                if self.currentPage == dot.tag {
                    dot.activate()
                }
                else {
                    dot.deactive()
                }
            }
        }
    }
    
    private var dots: [Dot] = [] {
//        didSet {
//            if dots.count == numberOfDots {
//                setupLayout()
//            }
//        }
    }
    
    lazy private var leftArrow: Arrow = {
        let arrow = Arrow(isRight: false, isActive: true)
        arrow.tag = 0
        arrow.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(nextPage(_:))))
        
        return arrow
    }()
    
    lazy private var rightArrow: Arrow = {
        let arrow = Arrow(isRight: true, isActive: false)
        arrow.tag = 1
        arrow.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(backPage(_:))))
        
        return arrow
    }()
    
    private lazy var container: UIStackView = UIStackView.init(frame: self.bounds)
}
