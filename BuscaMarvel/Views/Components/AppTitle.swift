//
//  Title.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 01/02/21.
//

import UIKit

class AppTitle {
    var container: UIView
    var parent: UIView
    
    private var _titleLabel: UILabel
    private var _subtitleLabel: UILabel
    private var _bar: UIView
    
    init(_ parent: UIView, title: String, subtitle: String, color: UIColor = .red, fontSize: CGFloat = 18.0) {
        self.parent = parent
        
        container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(container)
        
        _titleLabel = UILabel()
        _titleLabel.text = title
        _titleLabel.textColor = color
        _titleLabel.font = AppFonts.Title
        _titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        _subtitleLabel = UILabel()
        _subtitleLabel.text = subtitle
        _subtitleLabel.font = AppFonts.Subtitle
        _subtitleLabel.textColor = .red
        _subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(_titleLabel)
        
        _bar = UIView()
        _bar.translatesAutoresizingMaskIntoConstraints = false
        _bar.backgroundColor = .red
        container.addSubview(_bar)
        
        container.addSubview(_subtitleLabel)
        
        setupView()
    }
    
    //MARK: - Layout Configurations
    func setupView() {
        let constraints = [
            container.topAnchor.constraint(equalTo: parent.topAnchor),
            container.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            container.heightAnchor.constraint(equalToConstant: 45),
            _titleLabel.topAnchor.constraint(equalTo: container.topAnchor),
            _titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            _subtitleLabel.topAnchor.constraint(equalTo: container.topAnchor),
            _subtitleLabel.leadingAnchor.constraint(equalTo: _titleLabel.trailingAnchor, constant: 1),
            _bar.topAnchor.constraint(equalTo: _titleLabel.bottomAnchor, constant: 0),
            _bar.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            _bar.heightAnchor.constraint(equalToConstant: 3),
            _bar.widthAnchor.constraint(equalTo: _titleLabel.widthAnchor, multiplier: 0.45),
        ];
        
        parent.addConstraints(constraints)
    }
}
