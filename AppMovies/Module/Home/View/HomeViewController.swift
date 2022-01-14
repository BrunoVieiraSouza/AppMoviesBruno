//
//  ViewController.swift
//  AppMovies
//
//  Created by Bruno Vieira Souza on 12/01/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var presenter: HomeListViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: HomeListPresenterToViewProtocol {
    func showMovie() {
        
    }
    
    func showError() {
        
    }
    
    
}

