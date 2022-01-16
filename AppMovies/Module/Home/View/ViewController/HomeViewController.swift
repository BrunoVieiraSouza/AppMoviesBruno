//
//  ViewController.swift
//  AppMovies
//
//  Created by Bruno Vieira Souza on 12/01/22.
//

import UIKit
import Kingfisher
import SwiftUI

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
            return presenter?.getMovieSimilaresCount() ?? 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PosterPathTableViewCell", for: indexPath) as? PosterPathTableViewCell
            return cell ?? UITableViewCell()
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell
            let movie = presenter?.getMovie()

            DispatchQueue.main.async {
                self.posterPathMovie.kf.setImage(with: "\(movie?.posterPath ?? "")".url)
            }
            
            guard let title = movie?.originalTitle, let voteCount = movie?.voteCount, let populary = movie?.popularity else {
                return cell ?? UITableViewCell()
            }
            cell?.setCellMovie(title: title, like: voteCount, populary: populary)
            return cell ?? UITableViewCell()
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieSimilarTableViewCell", for: indexPath) as? MovieSimilarTableViewCell
            let moviesSimilares = presenter?.getMoviesSimilares(index: indexPath.row)
            guard let title = moviesSimilares?.title, let releaseDate = moviesSimilares?.releaseDate, let genre = moviesSimilares?.genreIDS, let posterPath = moviesSimilares?.posterPath else {
                
                return cell ?? UITableViewCell()
            }
            guard let genreString = cell?.setGenres(genre: genre) else {
                return cell ?? UITableViewCell()
            }
            cell?.setCellSimilares(title: title, date: releaseDate, genre: genreString, posterPath: posterPath)
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
                
                let index = Int(scrollView.contentOffset.y / scrollView.frame.height)
                
                let alphaFadeIn = (y - (scrollView.frame.height) * CGFloat(index) / scrollView.frame.height )
                let alpha = 1 - (alphaFadeIn / 200)
        
            posterPathMovie.alpha = alpha
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return posterPathMovie.frame.height - 30
        case 1:
            return 120
        default:
            return 105
        }
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

