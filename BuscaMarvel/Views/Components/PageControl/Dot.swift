//
//  Dot.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 22/02/21.
//

import UIKit

class Dot:UIView {
    var color: UIColor = .red
    var activeColor: UIColor = .lightGray
    var label: UILabel = { return UILabel()}()
    
    convenience init(){
        self.init(description: "0");
    }
    
    init(description: String){
        label.text = description
        label.textColor = .white
        label.font = AppFonts.Label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(frame: .zero)
        
        backgroundColor = color
        addSubview(label)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override var bounds: CGRect {
        didSet {
            layer.cornerRadius = bounds.height / 2
        }
    }
    
    func setupLayout() {
        addConstraints([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    func activate() {
        self.backgroundColor = activeColor
    }
    
    func deactive() {
        self.backgroundColor = color
    }
}
