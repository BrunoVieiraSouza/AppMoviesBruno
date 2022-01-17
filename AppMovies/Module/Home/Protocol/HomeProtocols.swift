//
//  HomeProtocols.swift
//  Movie-Teste-Bruno
//
//  Created by Bruno Vieira Souza on 11/01/22.
//

import Foundation
import UIKit

// MARK: - Protocolos do Modulo Home
protocol HomeListViewToPresenterProtocol: AnyObject {
    
    var view: HomeListPresenterToViewProtocol? { get set }
    var interactor: HomeListPresenterToInteractorProtocol? { get set }
    var router: HomeListPresenterToRouterProtocol? { get set }

    func updateView()
    func getMovieSimilaresCount() -> Int?
    func getMovie() -> MovieHomeModel?
    func getMoviesSimilares(index: Int) -> MoviesSimilaresModel?
}

protocol HomeListPresenterToViewProtocol: AnyObject {
    func showMovie()
    func showError()
}

protocol HomeListInteractorToPresenterProtocol: AnyObject {
    func movieFetched(movie: MovieHomeModel)
    func movieFetchedFailed()
    func movieSimilaresFetched(movies: ResultsMovies)
    func movieSimilaresFetchedFailed()
}

protocol HomeListPresenterToInteractorProtocol: AnyObject {
    var presenter: HomeListInteractorToPresenterProtocol? { get set }

    func fetchMovie()
    func fetchMovieSimilares()
}

protocol HomeListPresenterToRouterProtocol: AnyObject {
    static func createModule(from viewController: HomeViewController)
}
