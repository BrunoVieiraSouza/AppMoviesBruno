//
//  HomePresenter.swift
//  Movie-Teste-Bruno
//
//  Created by Bruno Vieira Souza on 11/01/22.
//

import Foundation

final class HomePresenter: HomeListViewToPresenterProtocol {
    
    private var movie: MovieHomeModel?
    private var moviesSimilares: [MoviesSimilaresModel]?
    
    //MARK: - Properties
    var view: HomeListPresenterToViewProtocol?
    var interactor: HomeListPresenterToInteractorProtocol?
    var router: HomeListPresenterToRouterProtocol?
    
    //MARK: - Methods
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

//MARK: - Extensions HomePresenter
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
        view?.showError()
    }
    
    func movieFetchedFailed() {
        view?.showError()
    }
}
