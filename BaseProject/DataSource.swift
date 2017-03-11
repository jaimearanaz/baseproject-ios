//
//  DataSource.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 07/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation

class DataSource: DataSourceDelegate {

    fileprivate var webServices: WebServicesDelegate?
    fileprivate var defaults: DefaultsDelegate?
    
    // MARK: - Public methods
    
    func setupDataSource(withWebServices webServices: WebServicesDelegate, defaults: DefaultsDelegate) {
        
        self.webServices = webServices
        self.defaults = defaults
    }
    
    // MARK: - DataSourceDelegate methods
    
    func getProductsFromA(completion: @escaping ((_ products: [Product], _ error: NSError?) -> Void)) {
        
        webServices?.getProducts(forCampaignId: "140") { (products: [Product], error: NSError?) in
            
            completion(products, error)
        }
    }
    
    func getProductsFromB(completion: @escaping ((_ products: [Product], _ error: NSError?) -> Void)) {
        
        webServices?.getProducts(forCampaignId: "141") { (products: [Product], error: NSError?) in
            
            completion(products, error)
        }
    }
    
    func isFirstExecution() -> Bool {
        
        return (defaults?.isFirstExecution())!
    }
    
    func setFirstExecution(_ first: Bool) {
        
        defaults?.setFirstExecution(first)
    }
}
