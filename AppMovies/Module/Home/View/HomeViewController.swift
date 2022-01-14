//
//  ViewController.swift
//  AppMovies
//
//  Created by Bruno Vieira Souza on 12/01/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var posterPathMovie: UIImageView!
    
    var presenter: HomeListViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
}

extension HomeViewController: HomeListPresenterToViewProtocol {
    func showMovie() {
        
    }
    
    func showError() {
        
    }
    
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "PosterPathTableViewCell", bundle: .main), forCellReuseIdentifier: "PosterPathTableViewCell")
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: .main), forCellReuseIdentifier: "MovieTableViewCell")
        tableView.register(UINib(nibName: "MovieSimilarTableViewCell", bundle: .main), forCellReuseIdentifier: "MovieSimilarTableViewCell")
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "PosterPathTableViewCell", for: indexPath) as? PosterPathTableViewCell
        
        return cell ?? UITableViewCell()
    }
}

extension HomeViewController: UITableViewDelegate {
    
}

