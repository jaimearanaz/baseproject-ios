//
//  ThirdScreenPresenter.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 08/05/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

class ThirdScreenPresenter: BasePresenter {
    
    fileprivate var controllerDelegate: ThirdScreenViewControllerDelegate?
    fileprivate var dataSource: DataSourceDelegate?
    fileprivate var router: RouterDelegate?
    
    // MARK: - Public methods
    
    func setupPresenter(controllerDelegate: ThirdScreenViewControllerDelegate,
                        dataSource: DataSourceDelegate,
                        router: RouterDelegate) {
        
        self.controllerDelegate = controllerDelegate
        self.dataSource = dataSource
        self.router = router
    }
    
    func viewController() -> UIViewController? {
        
        return controllerDelegate as? UIViewController
    }
}
