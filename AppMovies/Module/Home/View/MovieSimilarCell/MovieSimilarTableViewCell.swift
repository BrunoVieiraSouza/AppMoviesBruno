//
//  MovieTableViewCell.swift
//  AppMovies
//
//  Created by Bruno Vieira Souza on 14/01/22.
//

import UIKit

class MovieSimilarTableViewCell: UITableViewCell {

    @IBOutlet weak var posterPathImageView: UIImageView!
    @IBOutlet weak var titleMovieSimilarLabel: UILabel!
    @IBOutlet weak var dateMovieSimilarLabel: UILabel!
    @IBOutlet weak var genreMovieSimilarLabel: UILabel!
    
    func setCellSimilares(title: String, date: String, genre: [Int], posterPath: String) {
        let dateYear = date.firstWord()
        
        titleMovieSimilarLabel.text = title
        dateMovieSimilarLabel.text = dateYear
        genreMovieSimilarLabel.text = "\(genre)"
        posterPathImageView.kf.setImage(with: "\(posterPath)".url)
    }
}
