//
//  WebServicesFromLocal.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 07/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import JSONModel
import SwiftyTimer

class WebServicesFromLocal : WebServicesDelegate {

    fileprivate let delay: Double = 2
    
    // MARK: - WebServicesDelegate methods
    
    func getProducts(forCampaignId campaignId: String, completion: @escaping ((_ products: [Product], _ error: NSError?) -> Void)) {

        Timer.after(delay) {
            
            let path = Bundle.main.path(forResource: "products", ofType: "json")
            let fileManager = FileManager.default
            let data = fileManager.contents(atPath: path!)
            
            var errorProducts: NSError?
            let products: [Product] = self.parseCollection(data: data!, wrappedField: "products", parsingError: &errorProducts)

            completion(products, errorProducts)
        }
    }
    
    // MARK: Private methods
    
    fileprivate func parseCollection <T: JSONModel> (
        data: Data,
        wrappedField: String,
        parsingError: inout NSError?) -> [T] {
        
        var collection = [T]()
        
        do {
            
            let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary
            if let jsonDictionary = jsonDictionary, let results = jsonDictionary.object(forKey: wrappedField) {
                collection = try NSArray(array: T.arrayOfModels(fromDictionaries: results as! [AnyObject], error: ())) as! [T]
            }
            
            if (jsonDictionary == nil) {
            }
            
        } catch {
        }
        
        return collection
    }
}
