//
//  SecondScreenPresenter.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 07/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

class SecondScreenPresenter: SecondScreenPresenterDelegate {
    
    fileprivate var controllerDelegate: SecondScreenViewControllerDelegate?
    fileprivate var dataSource: DataSourceDelegate?
    fileprivate var router: RouterDelegate?
    fileprivate var products = [Product]()
    
    // MARK: - Public methods
    
    func setupPresenter(controllerDelegate: SecondScreenViewControllerDelegate,
                        dataSource: DataSourceDelegate,
                        router: RouterDelegate) {
        
        self.controllerDelegate = controllerDelegate
        self.dataSource = dataSource
        self.router = router
    }
    
    func viewController() -> UIViewController? {
        
        return controllerDelegate as? UIViewController
    }
    
    func showProducts(_ products: [Product]) {
        
        self.products = products
        controllerDelegate?.showProducts(products)
    }
    
    // MARK: - SecondScreenPresenterDelegate methods
    
    func didSelectSortByName() {
        
        let sortedProducts = products.sorted{ $0.name < $1.name }
        controllerDelegate?.showProducts(sortedProducts)
    }
    
    func didSelectSortByBrand() {
        
        let sortedProducts = products.sorted{ $0.brand < $1.brand }
        controllerDelegate?.showProducts(sortedProducts)
    }
    
    func didSelectSortByPrice() {
        
        let sortedProducts = products.sorted{
            
            let value1 = NSDecimalNumber(string: $0.price)
            let value2 = NSDecimalNumber(string: $1.price)
            return value1.compare(value2) == ComparisonResult.orderedDescending
        }
        
        controllerDelegate?.showProducts(sortedProducts)
    }
}
