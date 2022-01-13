//
//  HomeEntity.swift
//  Movie-Teste-Bruno
//
//  Created by Bruno Vieira Souza on 11/01/22.
//

import Foundation

// MARK: - Welcome
struct MovieHomeModel: Codable {
    
    let id: Int
    let originalTitle: String
    let popularity: Double
    let posterPath: String
    let voteCount: Int
}
