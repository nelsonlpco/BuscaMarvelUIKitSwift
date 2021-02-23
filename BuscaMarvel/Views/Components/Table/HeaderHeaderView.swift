//
//  HeaderHeaderView.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 13/02/21.
//

import UIKit

class HeaderHeaderView: UITableViewHeaderFooterView {
    private var _container: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private var _title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFonts.Label
        label.textColor = .white
        
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .red
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout Configurations
    private func setupLayout(){
        contentView.addSubview(_container)
        
        _container.addSubview(_title)
        
        _container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        _container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        _container.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        _container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        _title.leadingAnchor.constraint(equalTo: _container.leadingAnchor, constant: 110).isActive = true
        _title.centerYAnchor.constraint(equalTo: _container.centerYAnchor).isActive = true
    }
    
    func setTitle(_ title: String)  {
        _title.text = title.uppercased()
    }
}
