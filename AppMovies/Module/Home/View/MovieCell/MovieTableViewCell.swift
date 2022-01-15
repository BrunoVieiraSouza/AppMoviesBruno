//
//  MovieSimilarTableViewCell.swift
//  AppMovies
//
//  Created by Bruno Vieira Souza on 14/01/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieViewFundo: UIView!
    @IBOutlet weak var titleMovieLabel: UILabel!
    @IBOutlet weak var likeMovieLabel: UILabel!
    @IBOutlet weak var popularyMovieLabel: UILabel!
    
    func setCellMovie(title: String, like: Int, populary: Double) {
        titleMovieLabel.text = title
        likeMovieLabel.text = "🤍 \(like)"
        popularyMovieLabel.text = "🎦 \(populary)"
    }
}
