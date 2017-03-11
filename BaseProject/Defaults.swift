//
//  Defaults.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 08/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation

class Defaults: DefaultsDelegate {
    
    fileprivate let firstExecutionKey = "firstExecution"
    
    // MARK: DefaultsDelegate methods
    
    func isFirstExecution() -> Bool {
        
        let stored = UserDefaults.standard.bool(forKey: firstExecutionKey)
        return UserDefaults.standard.object(forKey: firstExecutionKey) != nil ? stored : true
    }
    
    func setFirstExecution(_ first: Bool) {
        
        UserDefaults.standard.set(first, forKey: firstExecutionKey)
    }
}
