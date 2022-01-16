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
    func getMovieCount() -> Int?
    func getMovie() -> MovieHomeModel?
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
}

//presenter para interactor
protocol HomeListPresenterToInteractorProtocol: AnyObject {
    var presenter: HomeListInteractorToPresenterProtocol? { get set }

    func fetchMovie()
}

// presenter para router
protocol HomeListPresenterToRouterProtocol: AnyObject {
    static func createModule(from viewController: HomeViewController)
}



