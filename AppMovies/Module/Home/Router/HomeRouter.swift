//
//  HomeRouter.swift
//  Movie-Teste-Bruno
//
//  Created by Bruno Vieira Souza on 11/01/22.
//

import Foundation
import UIKit

class HomeRouter {
    
    class func createModule() -> UIViewController {
        let view = HomeViewController()
       // let presenter: HomeListViewToPresenterProtocol & HomeListInteractorToPresenterProtocol = HomePresenter()
        
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}
