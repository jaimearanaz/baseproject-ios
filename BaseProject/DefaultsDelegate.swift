//
//  DefaultsDelegate.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 08/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation

protocol DefaultsDelegate {
    
    func isFirstExecution() -> Bool
    
    func setFirstExecution(_ first: Bool)
}
