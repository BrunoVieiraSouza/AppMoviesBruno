//
//  HomeRouter.swift
//  Movie-Teste-Bruno
//
//  Created by Bruno Vieira Souza on 11/01/22.
//

import Foundation
import UIKit

class HomeRouter: HomeListPresenterToRouterProtocol {
    
    class func createModule() -> UIViewController {
        let view = HomeViewController()
        let presenter: HomeListViewToPresenterProtocol & HomeListInteractorToPresenterProtocol = HomePresenter()
        let interactor: HomeListPresenterToInteractorProtocol = HomeInteractor()
        let router: HomeListPresenterToRouterProtocol = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    static var mainStoryBoard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}
