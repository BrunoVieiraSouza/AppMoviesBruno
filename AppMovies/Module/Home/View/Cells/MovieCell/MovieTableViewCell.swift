//
//  MovieSimilarTableViewCell.swift
//  AppMovies
//
//  Created by Bruno Vieira Souza on 14/01/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var movieViewFundo: UIView!
    @IBOutlet weak var titleMovieLabel: UILabel!
    @IBOutlet weak var likeMovieLabel: UILabel!
    @IBOutlet weak var popularyMovieLabel: UILabel!
    @IBOutlet weak var favoriteButtonOutlet: UIButton!
    
    //MARK: - Methods
    var cliqueButton = false
    
    func setCellMovie(title: String, like: Int, populary: Double) {
        titleMovieLabel.text = title
        likeMovieLabel.text = "🤍 \(like) Curtidas"
        popularyMovieLabel.text = "🎦 \(populary)"
    }
    
    @IBAction func favoritebutton(_ sender: UIButton) {

        let title = cliqueButton ? "💛" : "🤍"
        favoriteButtonOutlet.setTitle(title, for: .normal)
        cliqueButton.toggle()
    }
}
