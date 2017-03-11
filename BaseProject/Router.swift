//
//  Router.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 07/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit
import UINavigationControllerWithCompletionBlock

class Router: RouterDelegate {

    lazy var navigationController: UINavigationController? = {
        
        var navigationController: UINavigationController?
        
        if let rootViewController = self.presenterInstances?.firstScreenPresenter.viewController() {
            navigationController = UINavigationController(rootViewController: rootViewController)
            navigationController?.isNavigationBarHidden = false
        }
        
        return navigationController
    }()
    
    fileprivate var presenterInstances: PresenterInstances?
    
    // MARK: - Public methods
    
    func setupRouter(presenterInstances: PresenterInstances) {
        
        self.presenterInstances = presenterInstances
    }

    // MARK: - RouterDelegate methods
    
    func presentSecondScreen(withProducts products: [Product]) {
     
        let secondPresenter = presenterInstances?.secondScreenPresenter
        if let viewController = secondPresenter?.viewController() {
            
            navigationController?.pushViewController(viewController, animated: true, withCompletionBlock: {
                secondPresenter?.showProducts(products)
            })
        }
    }
}
