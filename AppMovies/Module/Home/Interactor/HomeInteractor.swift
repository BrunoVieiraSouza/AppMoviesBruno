//
//  HomeInteractor.swift
//  Movie-Teste-Bruno
//
//  Created by Bruno Vieira Souza on 11/01/22.
//

import Foundation

class HomeInteractor: HomeListPresenterToInteractorProtocol {

    var presenter: HomeListInteractorToPresenterProtocol?
    
    func fetchMovie() {
        REST.fetchMovie(idMovie: 585083) { movie in
            self.presenter?.movieFetched(movie: movie)
        } onError: { error in
            self.presenter?.movieFetchedFailed()
            print("error ao buscar movie")
        }
    }
}
