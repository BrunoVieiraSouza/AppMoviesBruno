//
//  HomeInteractor.swift
//  Movie-Teste-Bruno
//
//  Created by Bruno Vieira Souza on 11/01/22.
//

import Foundation

class HomeInteractor: HomeListPresenterToInteractorProtocol {

    var presenter: HomeListInteractorToPresenterProtocol?
    var idMovie: Int = 585083
    
    func fetchMovie() {
        API.fetchMovie(idMovie: idMovie) { movie in
            self.presenter?.movieFetched(movie: movie)
        } onError: { error in
            self.presenter?.movieFetchedFailed()
            print("error ao buscar movie")
        }
    }
    
    func fetchMovieSimilares() {
        API.fetchMoviesSimilar(idMovie: idMovie) { resultsMoviesSimilares in
            self.presenter?.movieSimilaresFetched(movies: resultsMoviesSimilares)
        } onError: { error in
            print("erro ao carregar filmes similares")
        }
    }
}
