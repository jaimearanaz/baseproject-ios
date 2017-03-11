//
//  WebServices.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 07/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import JSONModel

@objc class WebServices : NSObject, WebServicesDelegate {
    
    fileprivate let baseUrl = "http://164.132.106.201/app_dev.php/api/"
    fileprivate let serviceProducts = "campaign"
    
    // MARK: - WebServicesDelegate methods
    
    func getProducts(forCampaignId campaignId: String, completion: @escaping ((_ products: [Product], _ error: NSError?) -> Void)) {
        
        let requestUrl = "\(baseUrl)\(serviceProducts)/\(campaignId)"
        let request = NSMutableURLRequest(url: URL(string: requestUrl)!)
        
        launchAndParseCollectionRequest(request, wrappedInField: "products") { (products: [Product], error: NSError?) in
                
            completion(products, error)
        }
    }
    
    // MARK: - Private methods
    
    fileprivate func launchAndParseCollectionRequest <T: JSONModel> (
        _ request: NSMutableURLRequest,
        wrappedInField wrappedField: String,
        completion: ((_ collection: [T], _ error: NSError?) -> Void)? ) {
        
        WebServicesLogger.logRequest(request as URLRequest)

        let session = URLSession.shared;
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, errorRequest -> Void in
            
            var collection = [T]()
            var anyError: NSError?
            
            let httpResponse = response as? HTTPURLResponse
            let successStatus = (httpResponse != nil) && ((httpResponse?.statusCode)! >= 200) && ((httpResponse?.statusCode)! <= 299)
            let isValidResponse = (data != nil) && (errorRequest == nil) && successStatus
            
            if isValidResponse {
                
                WebServicesLogger.logResponse(data!)
                collection = self.parseCollection(data: data!, wrappedField: wrappedField, parsingError: &anyError)
                
            } else {
                
                let statusCode = (httpResponse != nil) ? httpResponse?.statusCode : 0
                let message = "exception requesting " + T.description() + ", status code " + String(describing: statusCode)
                anyError = NSError.init(domain: message, code: 0, userInfo: nil)
            }
            
            DispatchQueue.main.async(execute: {
                
                if let completion = completion {
                    completion(collection, anyError)
                }
            })
        })
        
        task.resume()
    }
    
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
                parsingError = NSError.init(domain: "exception parsing " + T.description(), code: 0, userInfo: nil)
            }
            
        } catch {
            
            parsingError = NSError.init(domain: "exception parsing " + T.description(), code: 0, userInfo: nil)
        }
        
        return collection
    }
}
