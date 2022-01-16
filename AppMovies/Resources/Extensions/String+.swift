//
//  Extencoes.swift
//  AppMovies
//
//  Created by Bruno Vieira Souza on 16/01/22.
//

import Foundation

let posterUrl = "http://image.tmdb.org/t/p/original"

extension String {
    var url: URL? {
        return URL(string: "\(posterUrl)\(self)")
    }
}

extension String {
    func firstWord() -> String? {
        return self.components(separatedBy: "-").first
    }
}
