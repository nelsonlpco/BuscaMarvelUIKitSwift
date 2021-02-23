//
//  NumericPageControl.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 22/02/21.
//

import UIKit

class NumericPageControl: UIControl {
    //MARK: - Properties
    private var numberOfPages: Int = 0 {
        didSet {
            for tag in 0 ..< numberOfPages {
                dots.append(makeDot(tag))
            }
        }
    }
    public var currentPage: Int = 0 {
        
        didSet {
            print("setando currentPage")
            print(currentPage)
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
        didSet {
            if dots.count == numberOfPages {
                setupLayout()
            }
        }
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
    
    //MARK: - Initializers
    convenience init() {
        self.init(withNumberOfPages: .zero)
    }
    
    init(withNumberOfPages pages: Int) {
        super.init(frame: .zero)
        setNumberOfPages(pages)
        self.currentPage = 0
        
        setupLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Helpers
    func setNumberOfPages(_ pages: Int) {
        self.numberOfPages = pages
    }
    
    private func makeDot(_ dotNumber: Int) -> Dot {
        let dot = Dot(description: String(dotNumber))
        if dotNumber == currentPage {
            print("ativar")
            dot.activate()
        }
        dot.tag = dotNumber
        dot.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(onTap(_:))))
        
        return dot
    }
    
    @objc private func onTap(_ sender: UITapGestureRecognizer){
        guard let dot = sender.view as? Dot else { print("Not converted to dot"); return }
        
        print(dot.tag)
        self.currentPage = dot.tag
        
        self.sendActions(for: .valueChanged)
    }
    
    @objc private func nextPage(_ sender: UITapGestureRecognizer) {
        guard let arrow = sender.view as? Arrow else { print("Not converted to Arrow"); return}
        if arrow.isActive {
            self.currentPage = self.currentPage + 1;
        }
    }
    
    @objc private func backPage(_ sender: UITapGestureRecognizer) {
        guard let arrow = sender.view as? Arrow else { print("Not converted to Arrow"); return}
        if arrow.isActive {
            self.currentPage = self.currentPage - 1;
        }
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
