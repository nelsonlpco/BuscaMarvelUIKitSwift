//
//  HomeScreen.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 02/02/22.
//

import UIKit

class HomeScreen {
    let container: UIView
    let parent: UIView
    
    private var _title: AppTitle
    private var _filterInput: FilterInput
    private var _divider: Dividir
    private var _pageControlContainer: UIView
    private let _filterContainer: UIView
    private let pc: NumericPageControl
    
    var table: UITableView
    
    init(_ parent: UIView) {
        self.parent = parent
        container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(container)
        
        _title = AppTitle(container, title: "BUSCA MARVEL", subtitle: "TESTE FRONT-END")
        
        _filterContainer = UIView()
        _filterContainer.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(_filterContainer)
        _filterInput = FilterInput(_filterContainer, label: "Nome do Personagem", placeholder: nil)
        
        
        table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(MobileTableViewCell.self, forCellReuseIdentifier: "mobilecell")
        table.register(HeaderHeaderView.self, forHeaderFooterViewReuseIdentifier: "mainheader")
        table.alwaysBounceVertical = false
        table.separatorStyle = .none
        container.addSubview(table)
        
        _pageControlContainer = UIView()
        _pageControlContainer.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(_pageControlContainer)
        
        _divider = Dividir(parent)
        
        pc = NumericPageControl.init(withNumberOfPages: 4)
        pc.addTarget(self, action: #selector(onChangePage(_:)), for: .valueChanged)
        pc.translatesAutoresizingMaskIntoConstraints = false
        _pageControlContainer.addSubview(pc)
        pc.centerYAnchor.constraint(equalTo: _pageControlContainer.centerYAnchor).isActive = true
        pc.centerXAnchor.constraint(equalTo: _pageControlContainer.centerXAnchor).isActive = true
        pc.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pc.widthAnchor.constraint(equalTo: _pageControlContainer.widthAnchor, multiplier: 0.6, constant: 0).isActive = true
        
        setupLayout()
    }
    
    @objc func onChangePage(_ sender: NumericPageControl) {
        print("selecionou: \(sender.currentPage)")
    }
    
    //MARK: - Layout Configurations
    func setupLayout() {
        let constraints = [
            container.topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor),
            container.leadingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            container.trailingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            container.bottomAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.bottomAnchor),
            _filterContainer.topAnchor.constraint(equalTo: _title.container.bottomAnchor),
            _filterContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            _filterContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            _filterContainer.heightAnchor.constraint(equalToConstant: 80),
            table.topAnchor.constraint(equalTo: _filterContainer.bottomAnchor, constant: 16),
            table.leadingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: _pageControlContainer.topAnchor),
            _pageControlContainer.heightAnchor.constraint(equalToConstant: 80),
            _pageControlContainer.bottomAnchor.constraint(equalTo: _divider.container.topAnchor),
            _pageControlContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            _pageControlContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
