//
//  HomeScreen.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 02/02/21.
//

import UIKit

class HomeScreen: NSObject, UITextFieldDelegate {
    private var _parent: UIView
    private var _title: AppTitle
    private var _filterInput: FilterInput
    private var _container: UIView
    var Container: UIView {
        get { return _container }
    }
    
    init(_ parent: UIView) {
        _parent = parent
        
        print("iniciou a home screen")
        
        _container = UIView()
        _container.translatesAutoresizingMaskIntoConstraints = false
        
        _parent.addSubview(_container)
        
        _title = AppTitle(_container, title: "BUSCA MARVEL", subtitle: "TESTE FRONT-END")
        _filterInput = FilterInput(_parent, description: "Nome do Personagem", placeholder: nil)
    }
    
    func setConstraints(_ externalContraints: [NSLayoutConstraint]? = nil) -> HomeScreen {
        let constraints = externalContraints ?? [
            _container.topAnchor.constraint(equalTo: _parent.safeAreaLayoutGuide.topAnchor, constant: 12),
            _container.leadingAnchor.constraint(equalTo: _parent.safeAreaLayoutGuide.leadingAnchor, constant: 33),
            _container.trailingAnchor.constraint(equalTo: _parent.safeAreaLayoutGuide.trailingAnchor, constant:  -33),
            _container.bottomAnchor.constraint(equalTo: _parent.safeAreaLayoutGuide.bottomAnchor),
        ]
        
        _filterInput = _filterInput.setConstraints([
            _filterInput.Container.topAnchor.constraint(equalTo: _title.Container.bottomAnchor),
            _filterInput.Container.leadingAnchor.constraint(equalTo: _container.leadingAnchor),
            _filterInput.Container.trailingAnchor.constraint(equalTo: _container.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate(constraints)
        
        _filterInput.Delegate = self
        
        return self
    }
    
    func textFieldShouldReturn(_ obj: UITextField) -> Bool {
        print("terminou de digitar: \(obj.text ?? "")")
        return true
    }
    
}
