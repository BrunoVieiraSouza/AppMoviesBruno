//
//  ViewController.swift
//  AppMovies
//
//  Created by Bruno Vieira Souza on 12/01/22.
//

import UIKit
import Kingfisher
import SwiftUI

final class HomeViewController: UIViewController {
    
    // MARK: - Iboutlets
    @IBOutlet weak var tableViewMovies: UITableView?
    @IBOutlet weak var posterPathMovie: UIImageView!
    
    //MARK: - Properties
    weak var presenter: HomeListViewToPresenterProtocol?
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeRouter.createModule(from: self)
        setUpTableView()
        presenter?.updateView()
    }
    
    //MARK: - Methods
    
    func numberSectionsTableView() -> Int {
        return 3
    }
    
    func setUpTableView() {
        guard let tableViewMovies = tableViewMovies else {
            return
        }
        
        tableViewMovies.dataSource = self
        
        tableViewMovies.register(UINib(nibName: "MovieSimilarTableViewCell", bundle: .main), forCellReuseIdentifier:
        tableViewMovies.register(UINib(nibName: "PosterPathTableViewCell", bundle: .main), forCellReuseIdentifier: "PosterPathTableViewCell")
        tableViewMovies.register(UINib(nibName: "MovieTableViewCell", bundle: .main), forCellReuseIdentifier: MovieTableViewCell.reuseIdentifier)
         MovieSimilarTableViewCell.reuseIdentifier)
        
        tableViewMovies.delegate = self
    }

}

// MARK: - Extensions HomeViewController
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1:
            return 1
        default:
            return presenter?.getMovieSimilaresCount() ?? 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberSectionsTableView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PosterPathTableViewCell", for: indexPath) as? PosterPathTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
            
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else {
                return UITableViewCell()
            }
            
            let movie = presenter?.getMovie()
            posterPathMovie.kf.setImage(with: "\(movie?.posterPath ?? "")".url)
            
            guard let title = movie?.originalTitle, let voteCount = movie?.voteCount, let populary = movie?.popularity else {
                return cell
            }
            
            cell.setCellMovie(title: title, like: voteCount, populary: populary)
            
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieSimilarTableViewCell", for: indexPath) as? MovieSimilarTableViewCell else {
                return UITableViewCell()
            }
            
            let moviesSimilares = presenter?.getMoviesSimilares(index: indexPath.row)
            
            guard let title = moviesSimilares?.title,
                  let releaseDate = moviesSimilares?.releaseDate,
                  let genres = moviesSimilares?.genreIDS,
                  let posterPath = moviesSimilares?.posterPath else {
                      return cell
                  }
            
            cell.setCellSimilares(title: title,
                                  date: releaseDate,
                                  posterPath: posterPath,
                                  genre: genres)
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}
//MARK: - TABLEVIEW DELEGATE

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return posterPathMovie.frame.height - 30
        case 1:
            return 125
        default:
            return 115
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let y = scrollView.contentOffset.y
        let index = Int(scrollView.contentOffset.y / scrollView.frame.height)
        let alphaFadeIn = (y - (scrollView.frame.height) * CGFloat(index) / scrollView.frame.height )
        let alpha = 1 - (alphaFadeIn / 200)
        
        posterPathMovie.alpha = alpha
    }

}

extension HomeViewController: HomeListPresenterToViewProtocol {
    
    func showMovie() {
        DispatchQueue.main.async {
            self.tableViewMovies?.reloadData()
        }
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alerta", message: "Houve um problema ao carregar o filme", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert,
                     animated: true,
                     completion: nil)
        
        print("erro showMovie View")
    }
}
