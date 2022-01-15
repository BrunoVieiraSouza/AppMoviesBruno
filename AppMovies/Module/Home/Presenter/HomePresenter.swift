//
//  HomePresenter.swift
//  Movie-Teste-Bruno
//
//  Created by Bruno Vieira Souza on 11/01/22.
//

import Foundation

class HomePresenter: HomeListViewToPresenterProtocol {
    
    var movie: MovieHomeModel?

    //MARK: - Properties
    var view: HomeListPresenterToViewProtocol?
    var interactor: HomeListPresenterToInteractorProtocol?
    var router: HomeListPresenterToRouterProtocol?
    
    
    func updateView() {
        interactor?.fetchMovie()
    }
    
    func getMovieCount() -> Int? {
        return 1
    }
    
    func getMovie() -> MovieHomeModel? {
        return movie
    }
}

extension HomePresenter: HomeListInteractorToPresenterProtocol {
    func movieFetched(movie: MovieHomeModel) {
        self.movie = movie
        view?.showMovie()
    }
    
    func movieFetchedFailed() {
        view?.showError()
    }
}
