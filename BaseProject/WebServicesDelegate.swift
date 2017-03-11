//
//  WebServicesDelegate.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 07/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation

protocol WebServicesDelegate {
    
    func getProducts(forCampaignId campaignId: String, completion: @escaping ((_ products: [Product], _ error: NSError?) -> Void))
}
