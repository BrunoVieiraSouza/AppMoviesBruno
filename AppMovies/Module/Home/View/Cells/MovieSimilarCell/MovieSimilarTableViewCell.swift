//
//  MovieTableViewCell.swift
//  AppMovies
//
//  Created by Bruno Vieira Souza on 14/01/22.
//

import UIKit

final class MovieSimilarTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: MovieSimilarTableViewCell.self)
    
    // MARK: - Dicionario dos Generos dos Movies
    private let genreDictionary: [Int: String] = [28: "Ação",
                                                  12: "Aventura",
                                                  16: "Animação",
                                                  35: "Comédia",
                                                  80: "Crime",
                                                  99: "Documentário",
                                                  18: "Drama",
                                                  10751: "Família",
                                                  14: "Fantasia",
                                                  36: "História",
                                                  27: "Terror",
                                                  10402: "Música",
                                                  9648: "Mistério",
                                                  10749: "Romance",
                                                  878: "Ficção científica",
                                                  10770: "Cinema TV",
                                                  53: "Thriller",
                                                  10752: "Guerra",
                                                  37: "Faroeste"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var posterPathImageView: UIImageView!
    @IBOutlet weak var titleMovieSimilarLabel: UILabel!
    @IBOutlet weak var dateMovieSimilarLabel: UILabel!
    @IBOutlet weak var genreMovieSimilarLabel: UILabel!
    
    //MARK: - Methods
    func setCellSimilares(title: String, date: String, posterPath: String, genre: [Int]) {
        
        var genreString = ""
        for (n, id) in genre.enumerated() {
            if n > 1 {
                break
            }
            let name = genreDictionary[id] ?? ""
            genreString = n > 0 ? genreString + ", " + name : name
        }
        
        let dateYear = date.firstWord()
        
        titleMovieSimilarLabel.text = title
        dateMovieSimilarLabel.text = dateYear
        genreMovieSimilarLabel.text = "\(genreString)"
        posterPathImageView.kf.setImage(with: "\(posterPath)".url)
    }
    
}
