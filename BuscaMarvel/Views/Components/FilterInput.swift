//
//  FilterInput.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 02/02/21.
//

import UIKit

class FilterInput {
    private var parent: UIView
    private var searchField: UITextField
    private var label: UILabel
    private var _container: UIStackView
    var Container: UIView {
        get { return self._container }
    }
    private var _delegate: UITextFieldDelegate?
    var Delegate: UITextFieldDelegate? {
        set(value) {
            _delegate = value
            searchField.delegate = _delegate
        }
        get { return _delegate }
    }
    
    init(_ parent: UIView, description: String, placeholder: String?){
        self.parent = parent
        
        let font = UIFont(name: Fonts.RobotoRegular.rawValue, size: 18)
        
        _container = UIStackView()
        _container.axis = .vertical
        _container.spacing = 1
        _container.translatesAutoresizingMaskIntoConstraints = false
        self.parent.addSubview(_container)
        
        label = UILabel()
        label.font = font
        label.textColor = .red
        label.text = description
        _container.addArrangedSubview(label)
        
        searchField = UITextField()
        searchField.font = font
        searchField.textColor = .black
        searchField.borderStyle = .roundedRect
        _container.addArrangedSubview(searchField)
    }
    
    //MARK: - Constraints
    func setConstraints(_ externalConstraints: [NSLayoutConstraint]? = nil) -> FilterInput {
        let constraints = externalConstraints ?? [
            _container.topAnchor.constraint(equalTo: parent.topAnchor),
            _container.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            _container.trailingAnchor.constraint(equalTo: parent.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        return self
    }
}
