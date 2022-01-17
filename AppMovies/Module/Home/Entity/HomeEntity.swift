//
//  HomeEntity.swift
//  Movie-Teste-Bruno
//
//  Created by Bruno Vieira Souza on 11/01/22.
//

import Foundation

// MARK: - MovieHomeModel
struct MovieHomeModel: Codable {
    
    let id: Int
    let originalTitle: String
    let popularity: Double
    let posterPath: String
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case popularity
        case posterPath = "poster_path"
        case voteCount = "vote_count"
    }
}
