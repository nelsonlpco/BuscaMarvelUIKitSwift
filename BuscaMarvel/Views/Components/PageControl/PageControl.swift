//
//  File.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 20/02/21.
//

import UIKit

@IBDesignable
class PageControl: UIControl {
    //MARK: - Properties
    @IBInspectable var pageIndicatorTintColor: UIColor? = .lightGray
    @IBInspectable var currentPageIndicatorTintColor: UIColor? = .darkGray
    private lazy var stackView = UIStackView.init(frame: self.bounds)
    
    private lazy var constantSpace = ((stackView.spacing) * CGFloat(numberOfPages - 1) + ((self.bounds.height * 0.45) * CGFloat(numberOfPages)) - self.bounds.width)
      
    
    private var numberOfDots = [UIView]() {
        didSet{
            if numberOfDots.count == numberOfPages {
                setupViews()
            }
        }
    }
    
    @IBInspectable var numberOfPages: Int = 0  {
        didSet {
            for tag in 0 ..< numberOfPages {
                let dot = getDotView()
                dot.tag = tag
                dot.backgroundColor = pageIndicatorTintColor
                self.numberOfDots.append(dot)
            }
        }
    }
    
    var currentPage: Int = 0 {
        didSet {
            print("CurrentPage is \(currentPage)")
        }
    }
   
    
    override var bounds: CGRect {
      didSet{
        self.numberOfDots.forEach { (dot) in
          self.setupDotAppearance(dot: dot)
        }
      }
    }
    
    // MARK: - Initializers
    convenience init() {
        self.init(frame: .zero)
    }
    
    init(withNoOfPages pages: Int) {
        self.numberOfPages = pages
        self.currentPage = 0
        super.init(frame: .zero)
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

   //MARK: - Helper methods...
    private func getDotView() -> UIView {
        let dot = UIView()
        self.setupDotAppearance(dot: dot)
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(onPageControlTapped(_:))))
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13)
        
        dot.addSubview(label)
        
        label.centerYAnchor.constraint(equalTo: dot.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: dot.centerXAnchor).isActive = true
        
        return dot
    }
    
    @objc private func onPageControlTapped(_ sender: UITapGestureRecognizer) {
        
        guard let selectedDot = sender.view else { return }
        
        _ = numberOfDots.map { (dot) in
          setupDotAppearance(dot: dot)
          if dot.tag == selectedDot.tag {
            currentPage = selectedDot.tag
            
            UIView.animate(withDuration: 0.2, animations: {
              dot.layer.cornerRadius = dot.bounds.height / 4
              dot.transform = CGAffineTransform.init(scaleX: 1.5, y: 1)
              selectedDot.backgroundColor = self.currentPageIndicatorTintColor
            })
            self.sendActions(for: .valueChanged)
          }
        }
    }
    
    private func setupDotAppearance(dot: UIView) {
      dot.transform = .identity
      dot.layer.cornerRadius = dot.bounds.height / 2
      dot.layer.masksToBounds = true
      dot.backgroundColor = pageIndicatorTintColor
    }
    
    private func setupViews() {
        self.numberOfDots.forEach { (dot) in
            self.stackView.addArrangedSubview(dot)
        }
        
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
            
            
        self.addConstraints([
              
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        stackView.heightAnchor.constraint(equalTo: self.heightAnchor),
              
              ])
            
            self.numberOfDots.forEach { dot in
              
              self.addConstraints([
                
                dot.centerYAnchor.constraint(equalTo: self.stackView.centerYAnchor),
                dot.widthAnchor.constraint(equalTo: self.stackView.heightAnchor, multiplier: 0.60, constant: 0),
                dot.heightAnchor.constraint(equalTo: self.stackView.heightAnchor, multiplier: 0.60, constant: 0)
                
                ])
              
            }
        
    }

}
