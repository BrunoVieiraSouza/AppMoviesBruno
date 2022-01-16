//
//  ViewController.swift
//  AppMovies
//
//  Created by Bruno Vieira Souza on 12/01/22.
//

import UIKit

class HomeViewController: UIViewController {
    

    @IBOutlet weak var tableViewMovies: UITableView!
    @IBOutlet weak var posterPathMovie: UIImageView!
    
    weak var presenter: HomeListViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        HomeRouter.createModule(from: self)
        setUpTableView()
        presenter?.updateView()
        
    }
    
    func setUpTableView() {
        guard let tableViewMovies = tableViewMovies else {return}
        tableViewMovies.dataSource = self
        tableViewMovies.delegate = self
        tableViewMovies.register(UINib(nibName: "PosterPathTableViewCell", bundle: .main), forCellReuseIdentifier: "PosterPathTableViewCell")
        tableViewMovies.register(UINib(nibName: "MovieTableViewCell", bundle: .main), forCellReuseIdentifier: "MovieTableViewCell")
        tableViewMovies.register(UINib(nibName: "MovieSimilarTableViewCell", bundle: .main), forCellReuseIdentifier: "MovieSimilarTableViewCell")
    }
}

extension HomeViewController: HomeListPresenterToViewProtocol {
    
    func showMovie() {
        DispatchQueue.main.async {
            self.tableViewMovies?.reloadData()
        }
    }
    
    func showError() {
        print("erro no showMovie View")
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
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PosterPathTableViewCell", for: indexPath) as? PosterPathTableViewCell
            return cell ?? UITableViewCell()
        }
        
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell
    
            let movie = presenter?.getMovie()
            
            guard let title = movie?.originalTitle, let voteCount = movie?.voteCount, let populary = movie?.popularity else {
                return cell ?? UITableViewCell()
            }
          cell?.setCellMovie(title: title, like: voteCount, populary: populary)
            return cell ?? UITableViewCell()
        }
        if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieSimilarTableViewCell", for: indexPath) as? MovieSimilarTableViewCell
            return cell ?? UITableViewCell()
        }
        return UITableViewCell()
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let alpha = scrollView.contentOffset.y
        //alpha =  alpha / 1000
        //print(alpha)
        posterPathMovie.alpha = 1
        if alpha < 100.0  {
            posterPathMovie.alpha = 0.8
        }
        if alpha < 200.0 {
            posterPathMovie.alpha = 0.6
        }
        if alpha < 300.0  {
            posterPathMovie.alpha = 0.4
        }
        if alpha < 200.0  {
            posterPathMovie.alpha = 0.2
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return posterPathMovie.frame.height
        }
        if indexPath.section == 1 {
            return 130
        }
        return 90.0
    }
}

