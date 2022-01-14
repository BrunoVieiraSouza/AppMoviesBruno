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
       // tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: "PosterPathTableViewCell", bundle: .main), forCellReuseIdentifier: "PosterPathTableViewCell")
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PosterPathTableViewCell", for: indexPath) as? PosterPathTableViewCell
        
        return cell ?? UITableViewCell()
    }
}

extension HomeViewController: UITableViewDelegate {
    
}

