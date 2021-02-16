//
//  FilterInput.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 02/02/21.
//

import UIKit

class FilterInput {
    var parent: UIView
    var container: UIStackView
    private var _searchField: UITextField
    private var _label: UILabel
    
    private var _delegate: UITextFieldDelegate?
    var Delegate: UITextFieldDelegate? {
        set(value) {
            _delegate = value
            _searchField.delegate = _delegate
        }
        get { return _delegate }
    }
    
    init(_ parent: UIView, label: String, placeholder: String?){
        self.parent = parent
        
        container = UIStackView()
        container.axis = .vertical
        container.spacing = 1
        container.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(container)
        
        _label = UILabel()
        _label.font = AppFonts.Label
        _label.textColor = .red
        _label.text = label
        container.addArrangedSubview(_label)
        
        _searchField = UITextField()
        _searchField.font = AppFonts.Label
        _searchField.textColor = .black
        _searchField.borderStyle = .roundedRect
        container.addArrangedSubview(_searchField)
        
        setupView()
    }
    
    //MARK: - Layout Configurations
    func setupView() {
        let constraints = [
            container.topAnchor.constraint(equalTo: parent.topAnchor),
            container.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: parent.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
