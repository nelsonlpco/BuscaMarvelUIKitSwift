//
//  NumericPageControl.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 22/02/21.
//

import UIKit

class NumericPageControl: UIControl {
    //MARK: - Properties
    lazy private var presentation: PageControlPresentation = {
        return NumericPageControlPresentation(withDelegate: self)
    }()
    
    private var dots: [Dot] = []
    
    public var currentPage: Int = 0 {
        didSet {
            self.sendActions(for: .valueChanged)
            
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
    
    lazy private var leftArrow: Arrow = {
        let arrow = Arrow(isRight: false, isActive: true)
        arrow.tag = 0
        arrow.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(nextPageHandler(_:))))
        
        return arrow
    }()
    
    lazy private var rightArrow: Arrow = {
        let arrow = Arrow(isRight: true, isActive: false)
        arrow.tag = 1
        arrow.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(backPageHandler(_:))))
        
        return arrow
    }()
    
    private lazy var container: UIStackView = UIStackView.init(frame: self.bounds)
    
    //MARK: - Initializers
    convenience init() {
        self.init(frame: .zero)

        setupLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Actions
    func setTotalDots(_ total: Int) {
        self.presentation.setTotalDots(total)
    }
    
    
    private func makeDot(_ dotModel: DotModel) -> Dot {
        let dot = Dot(description: dotModel.label)
        if dotModel.isActive {
            dot.activate()
        }
        dot.tag = dotModel.tag
        dot.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(onTap(_:))))
        
        return dot
    }
    
    @objc private func nextPageHandler(_ sender: UITapGestureRecognizer) {
        presentation.nextPage()
        self.sendActions(for: .valueChanged)
    }
    
    @objc private func backPageHandler(_ sender: UITapGestureRecognizer) {
        presentation.backPage()
        self.sendActions(for: .valueChanged)
    }
    
    @objc private func onTap(_ sender: UITapGestureRecognizer){
        guard let dot = sender.view as? Dot else { print("Not converted to dot"); return }
        presentation.setCurrentPage(dot.tag)
    }
    
    //MARK: - Layout configurations
    func setupLayout() {
        self.container.addArrangedSubview(leftArrow)
        
        self.dots.forEach { dot in
            self.container.addArrangedSubview(dot)
        }
        
        self.container.addArrangedSubview(rightArrow)
        
        container.translatesAutoresizingMaskIntoConstraints = false
        container.alignment = .center
        container.axis = .horizontal
        container.distribution = .fillEqually
        container.spacing = 8
        self.addSubview(container)
        
        addConstraints([
            container.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            container.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            container.heightAnchor.constraint(equalTo: self.heightAnchor),
            leftArrow.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            leftArrow.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.7, constant: 0),
            leftArrow.widthAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.7, constant: 0),
            rightArrow.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            rightArrow.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.7, constant: 0),
            rightArrow.widthAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.7, constant: 0),
        ])
        
        dots.forEach { dot in
            addConstraints([
                dot.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                dot.widthAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.7, constant: 0),
                dot.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.7, constant: 0),
            ])
        }
    }
}

//MARK: - Delegate
extension NumericPageControl: NumericPageControlDelegate {
    func updateLeftArrow(isActive: Bool) {
        if isActive {
            leftArrow.active()
        }
        else {
            leftArrow.desactive()
        }
    }
    
    func updateRightArrow(isActive: Bool) {
        if isActive {
            rightArrow.active()
        }
        else {
            rightArrow.desactive()
        }
    }
    
    
    func makeDots(_ dotsModel: [DotModel]) {
        for dot in dotsModel {
            dots.append(makeDot(dot))
        }
        
        setupLayout()
    }
    
    func updateDots(_ dotsModel: [DotModel]) {
        for (index, dotModel) in dotsModel.enumerated() {
            let dot = dots[index]
            dot.tag = dotModel.tag
            dot.label.text = dotModel.label
            
            if(dotModel.isActive) {
                dots[index].activate()
            } else {
                dots[index].deactive()
            }
        }
    }
    
    func incrementDots() {
        for dot in dots {
            dot.tag = dot.tag + 1
            dot.label.text = String(dot.tag)
        }
    }
    
    func decrementDots() {
        for dot in dots {
            dot.tag = dot.tag - 1
            dot.label.text = String(dot.tag)
        }
    }
}
