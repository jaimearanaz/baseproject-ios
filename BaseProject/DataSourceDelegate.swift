//
//  DataSourceProtocol.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 07/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation

protocol DataSourceDelegate {
    
    func getProductsFromA(completion: @escaping ((_ products: [Product], _ error: NSError?) -> Void))
    
    func getProductsFromB(completion: @escaping ((_ products: [Product], _ error: NSError?) -> Void))
    
    func isFirstExecution() -> Bool
    
    func setFirstExecution(_ first: Bool)
}
