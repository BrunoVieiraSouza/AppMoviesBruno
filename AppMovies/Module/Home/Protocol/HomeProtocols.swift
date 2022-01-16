//
//  HomeProtocols.swift
//  Movie-Teste-Bruno
//
//  Created by Bruno Vieira Souza on 11/01/22.
//

import Foundation
import UIKit

// view para presenter
protocol HomeListViewToPresenterProtocol: AnyObject {
    var view: HomeListPresenterToViewProtocol? { get set }
    var interactor: HomeListPresenterToInteractorProtocol? { get set }
    var router: HomeListPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getMovieSimilaresCount() -> Int?
    func getMovie() -> MovieHomeModel?
    func getMoviesSimilares(index: Int) -> MoviesSimilaresModel?
}

// presenter para view
protocol HomeListPresenterToViewProtocol: AnyObject {
    func showMovie()
    func showError()
}

// interactor para presenter
protocol HomeListInteractorToPresenterProtocol: AnyObject {
    func movieFetched(movie: MovieHomeModel)
    func movieFetchedFailed()
    func movieSimilaresFetched(movies: ResultsMovies)
    func movieSimilaresFetchedFailed()
}

//presenter para interactor
protocol HomeListPresenterToInteractorProtocol: AnyObject {
    var presenter: HomeListInteractorToPresenterProtocol? { get set }

    func fetchMovie()
    func fetchMovieSimilares()
}

// presenter para router
protocol HomeListPresenterToRouterProtocol: AnyObject {
    static func createModule(from viewController: HomeViewController)
}



