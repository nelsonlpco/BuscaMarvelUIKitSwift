//
//  Divider.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 20/02/21.
//

import UIKit

class Dividir {
    let container: UIView
    let parent: UIView
        
    init(_ parent: UIView){
        self.parent = parent
        container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .red
        
        parent.addSubview(container)
        
        setupView()
    }
    
   //MARK: - Layout Configurations
    func setupView() {
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: parent.bottomAnchor),
            container.heightAnchor.constraint(equalToConstant: 10),
        ])
    }
}
