//
//  HomePresenter.swift
//  Movie-Teste-Bruno
//
//  Created by Bruno Vieira Souza on 11/01/22.
//

import Foundation

class HomePresenter: HomeListViewToPresenterProtocol {
    
    var movie: MovieHomeModel?
    var moviesSimilares: [MoviesSimilaresModel]?

    //MARK: - Properties
    var view: HomeListPresenterToViewProtocol?
    var interactor: HomeListPresenterToInteractorProtocol?
    var router: HomeListPresenterToRouterProtocol?
    
    func updateView() {
        interactor?.fetchMovie()
        interactor?.fetchMovieSimilares()
    }

    func getMovie() -> MovieHomeModel? {
        return movie
    }
    
    func getMoviesSimilares(index: Int) -> MoviesSimilaresModel? {
        return moviesSimilares?[index]
    }
    
    func getMovieSimilaresCount() -> Int? {
        return moviesSimilares?.count
    }
}

extension HomePresenter: HomeListInteractorToPresenterProtocol {
    func movieFetched(movie: MovieHomeModel) {
        self.movie = movie
        view?.showMovie()
    }
    
    func movieSimilaresFetched(movies: ResultsMovies) {
        self.moviesSimilares = movies.results
        view?.showMovie()
    }
    
    func movieSimilaresFetchedFailed() {
        
    }
    
    
    func movieFetchedFailed() {
        view?.showError()
    }
}
