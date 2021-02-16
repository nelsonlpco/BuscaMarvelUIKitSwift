//
//  ViewController.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 30/01/21.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HeroResponseDelegate {
    
    
    var data: [Hero] = []
    var homeScreen: HomeScreen?
    var heroRepository: HeroRepository?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeScreen = HomeScreen(self.view)
        homeScreen?.table.dataSource = self
        homeScreen?.table.delegate = self
        
        heroRepository = HeroRepository(delegate: self)
        
        loadData()
    }
    
    //MARK: - TABLE VIEW CONTROLLERS
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mobilecell", for: indexPath) as! MobileTableViewCell
        let item = data[indexPath.item]
        cell.setImage(imagePath: item.resourceURI!)
        cell.setName(name: item.name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "mainheader") as! HeaderHeaderView
        
        header.setTitle("Nome")
        
        return header
    }

    //MARK: - Respository
    
    func onError(errorMessage: String) {
        print("Erro ao carregar dados: \(errorMessage)")
    }
    
    func onSuccess(data: HeroResponse) {
        self.data = data.results
        homeScreen?.table.reloadData()
    }

    private func loadData() {
        heroRepository?.getHeroesByOffset()
        homeScreen?.table.reloadData()
    }
}

