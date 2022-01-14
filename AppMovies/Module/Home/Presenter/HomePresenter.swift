//
//  HomePresenter.swift
//  Movie-Teste-Bruno
//
//  Created by Bruno Vieira Souza on 11/01/22.
//

import Foundation

class HomePresenter {
    
    //MARK: - Properties
    weak var view: HomeListPresenterToViewProtocol?
    var interactor: HomeListPresenterToInteractorProtocol?
    var router: HomeListPresenterToRouterProtocol?
    
    
}

extension HomePresenter: HomeListInteractorToPresenterProtocol {
    func movieFetched() {
        
    }
    
    func movieFetchedFailed() {
        
    }
    
    
}
