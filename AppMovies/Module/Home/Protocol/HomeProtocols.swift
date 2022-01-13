//
//  HomeProtocols.swift
//  Movie-Teste-Bruno
//
//  Created by Bruno Vieira Souza on 11/01/22.
//

import Foundation
import UIKit

protocol HomeListPresenterToViewProtocol: AnyObject {
    func showMovie()
    func showError()
}

protocol HomeListInteractorToPresenterProtocol: AnyObject {
    func movieFetched()
    func movieFetchedFailed()
}

protocol HomeListPresenterToInteractor: AnyObject {
    var presenter: HomeListPresenterToInteractor? { get set }
    var movie: MovieHomeModel? { get }
    
    func fetchLiveNews()
}

protocol HomeListPresenterToRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}

protocol HomeListViewToPresenterProtocol: AnyObject {
    var view: HomeListPresenterToViewProtocol? { get set }
    var interactor: HomeListPresenterToInteractor? { get set }
    var router: HomeListPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getMovieCount() -> Int?
    func getMovie(index: Int) -> MovieHomeModel?
}
