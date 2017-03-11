//
//  FirstScreenPresenter.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 07/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import SDWebImage
import UIKit

class FirstScreenPresenter: FirstScreenPresenterDelegate {
    
    fileprivate var controllerDelegate: FirstScreenViewControllerDelegate?
    fileprivate var dataSource: DataSourceDelegate?
    fileprivate var router: RouterDelegate?
    fileprivate var products = [Product]()
    
    // MARK: - Public methods
    
    func setupPresenter(controllerDelegate: FirstScreenViewControllerDelegate,
                        dataSource: DataSourceDelegate,
                        router: RouterDelegate) {
        
        self.controllerDelegate = controllerDelegate
        self.dataSource = dataSource
        self.router = router
    }

    func viewController() -> UIViewController? {
        
        return controllerDelegate as? UIViewController
    }
    
    // MARK: - FirstScreenPresenterDelegate methods
    
    func didSelectGo() {
        
        if (dataSource?.isFirstExecution() ?? false) {
            dataSource?.setFirstExecution(false)
        }
        
        controllerDelegate?.startLoadingState()
        
        dataSource?.getProductsFromA(completion: { (products: [Product], error: NSError?) in
            
            let validResponse = (products.count > 0) && (error == nil)
            
            if (validResponse) {
                
                self.products = products
                self.downloadAllImagesAndPresentSecondScreen(forProducts: products)
                
            } else {
                
                self.controllerDelegate?.stopLoadingState()
                let message = NSLocalizedString("NO_PRODUCTS", comment: "Error message when there are no products")
                self.controllerDelegate?.showMessage(message)
            }
        })
    }
    
    // MARK: - Private methods
    
    fileprivate func downloadAllImagesAndPresentSecondScreen(forProducts products: [Product]) {
 
        let images = urls(fromProducts: products)
        
        ImageDownloader.downloadAndCacheImages(images) { (_, _) in
         
            self.controllerDelegate?.stopLoadingState()
            self.router?.presentSecondScreen(withProducts: products)
        }
    }
    
    fileprivate func urls(fromProducts products: [Product]) -> [URL] {
        
        var urls = [URL]()
        
        urls = products.map({
            
            if let url = URL(string:$0.image) {
                return url
            } else {
                return URL(string:"")!
            }
        })
    
        return urls
    }
}
