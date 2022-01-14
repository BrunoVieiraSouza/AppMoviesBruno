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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
