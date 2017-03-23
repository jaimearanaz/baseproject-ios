//
//  BasePresenter.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 14/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation

class BasePresenter: BasePresenterDelegate {
 
    fileprivate var controllerDelegate: BaseViewControllerDelegate!
    fileprivate var router: RouterDelegate!
    fileprivate var dataSource: DataSourceDelegate!
    
    // MARK: - Public methods
    
    func setupPresenter(controllerDelegate: BaseViewControllerDelegate,
                        dataSource: DataSourceDelegate,
                        router: RouterDelegate) {
        
        self.controllerDelegate = controllerDelegate
        self.dataSource = dataSource
        self.router = router
    }
}
