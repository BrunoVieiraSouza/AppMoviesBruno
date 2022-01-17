//
//  MoviesSimilaresModel.swift
//  AppMovies
//
//  Created by Bruno Vieira Souza on 16/01/22.

import Foundation

// MARK: - Entity Movies Similares

struct ResultsMovies: Codable {
    let page: Int
    let results: [MoviesSimilaresModel]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct MoviesSimilaresModel: Codable {
    let genreIDS: [Int]
    let title: String
    let posterPath, releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case genreIDS =  "genre_ids"
        case title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}
