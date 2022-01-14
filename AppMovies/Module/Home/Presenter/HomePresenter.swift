//
//  HomePresenter.swift
//  Movie-Teste-Bruno
//
//  Created by Bruno Vieira Souza on 11/01/22.
//

import Foundation

class HomePresenter: HomeListViewToPresenterProtocol {

    //MARK: - Properties
    weak var view: HomeListPresenterToViewProtocol?
    var interactor: HomeListPresenterToInteractorProtocol?
    var router: HomeListPresenterToRouterProtocol?
    
    
    func updateView() {
    
    }
    
    func getMovieCount() -> Int? {
        return nil
    }
    
    func getMovie(index: Int) -> MovieHomeModel? {
        return nil
    }
}

extension HomePresenter: HomeListInteractorToPresenterProtocol {
    func movieFetched() {
        
    }
    
    func movieFetchedFailed() {
        
    }
    
    
}
