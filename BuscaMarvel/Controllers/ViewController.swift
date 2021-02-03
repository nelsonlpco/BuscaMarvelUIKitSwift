//
//  ViewController.swift
//  BuscaMarvel
//
//  Created by Nelson Prado on 30/01/21.
//

import UIKit

class ViewController: UIViewController {
    var homeScreen: HomeScreen?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homeScreen = HomeScreen(self.view).setConstraints()
        
    }
}

