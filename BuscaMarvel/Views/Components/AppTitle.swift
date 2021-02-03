//
//  Title.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 01/02/21.
//

import UIKit

class AppTitle: NSObject {
    private var titleContainer: UIView
    var Container: UIView {
        get { return titleContainer}
    }
    private var titleLabel: UILabel
    private var subtitleLabel: UILabel
    private var bar: UIView
    
    init(_ parent: UIView, title: String, subtitle: String, color: UIColor = .red, fontSize: CGFloat = 18.0) {
        let titleFont = UIFont(name: Fonts.RobotoBlack.rawValue, size: fontSize)
        let subtitleFont = UIFont(name: Fonts.RobotoLight.rawValue, size: fontSize)
        
        titleContainer = UIView()
        titleContainer.translatesAutoresizingMaskIntoConstraints = false
        
        parent.addSubview(titleContainer)
        
        titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = color
        titleLabel.font = titleFont
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        subtitleLabel = UILabel()
        subtitleLabel.text = subtitle
        subtitleLabel.font = subtitleFont
        subtitleLabel.textColor = .red
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        bar = UIView()
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.backgroundColor = .red
        
        titleContainer.addSubview(titleLabel)
        titleContainer.addSubview(subtitleLabel)
        titleContainer.addSubview(bar)
        
        titleContainer.topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
        titleContainer.leadingAnchor.constraint(equalTo: parent.leadingAnchor).isActive = true
        titleContainer.trailingAnchor.constraint(equalTo: parent.trailingAnchor).isActive = true
        titleContainer.heightAnchor.constraint(equalToConstant: 45).isActive = true

        titleLabel.topAnchor.constraint(equalTo: titleContainer.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: titleContainer.leadingAnchor).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: titleContainer.topAnchor).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 1).isActive = true
        
        bar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        bar.leadingAnchor.constraint(equalTo: titleContainer.leadingAnchor).isActive = true
        bar.heightAnchor.constraint(equalToConstant: 3).isActive = true
        bar.widthAnchor.constraint(equalTo: titleLabel.widthAnchor, multiplier: 0.45).isActive = true
    }
}
