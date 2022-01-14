//
//  HomeInteractor.swift
//  Movie-Teste-Bruno
//
//  Created by Bruno Vieira Souza on 11/01/22.
//

import Foundation

class HomeInteractor: HomeListPresenterToInteractorProtocol {

    weak var presenter: HomeListInteractorToPresenterProtocol?
    var movie: MovieHomeModel?
    
    func fetchMovie() {
        REST.fetchMovie(idMovie: 568124) { success in
            self.movie = success
        } onError: { error in
            print("error")
        }
    }
}
