//
//  PresenterInstances.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 07/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation

class PresenterInstances {
    
    fileprivate var router: RouterDelegate?
    fileprivate var dataSource: DataSourceDelegate?
    
    lazy var firstScreenPresenter: FirstScreenPresenter = {

        let presenter = FirstScreenPresenter()
        let viewController = FirstScreenViewController(nibName: "FirstScreenViewController", bundle: nil)
        
        presenter.setupPresenter(controllerDelegate: viewController,
                                 dataSource: self.dataSource!,
                                 router: self.router!)
        viewController.setupViewController(presenterDelegate: presenter)
        
        return presenter
    }()
    
    lazy var secondScreenPresenter: SecondScreenPresenter = {
        
        let presenter = SecondScreenPresenter()
        let viewController = SecondScreenViewController(nibName: "SecondScreenViewController", bundle: nil)
        
        presenter.setupPresenter(controllerDelegate: viewController,
                                 dataSource: self.dataSource!,
                                 router: self.router!)
        viewController.setupViewController(presenterDelegate: presenter)
        
        return presenter
    }()
    
    lazy var thirdScreenPresenter: ThirdScreenPresenter = {
        
        let presenter = ThirdScreenPresenter()
        let viewController = ThirdScreenViewController(nibName: "ThirdScreenViewController", bundle: nil)
        
        presenter.setupPresenter(controllerDelegate: viewController,
                                 dataSource: self.dataSource!,
                                 router: self.router!)
        viewController.setupViewController(presenterDelegate: presenter)
        
        return presenter
    }()
    
    // MARK: - Public methods
    
    func setupPresenterInstances(router: RouterDelegate, dataSource: DataSourceDelegate) {
     
        self.router = router
        self.dataSource = dataSource
    }
}
