//
//  HomeInteractor.swift
//  Movie-Teste-Bruno
//
//  Created by Bruno Vieira Souza on 11/01/22.
//

import Foundation

class HomeInteractor: HomeListPresenterToInteractorProtocol {
    
    //MARK: - Properties
    var presenter: HomeListInteractorToPresenterProtocol?
    var idMovie: Int = 585083
    
    //MARK: - Methods request
    func fetchMovie() {
        API.fetchMovie(idMovie: idMovie) { movie in
            self.presenter?.movieFetched(movie: movie)
        } onError: { error in
            
            switch error {
            case .responseStatusCode(code: _):
                self.presenter?.movieFetchedFailed()
            default:
                print("error ao buscar movies")
            }
        }
    }
    
    func fetchMovieSimilares() {
        API.fetchMoviesSimilar(idMovie: idMovie) { resultsMoviesSimilares in
            self.presenter?.movieSimilaresFetched(movies: resultsMoviesSimilares)
        } onError: { error in
            switch error {
            case .responseStatusCode(code: _):
                self.presenter?.movieFetchedFailed()
            default:
                print("error ao buscar movie similares")
            }
        }
    }
}
