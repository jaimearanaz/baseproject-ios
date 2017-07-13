//
//  UIViewSubclass.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 13/07/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

class UIViewSubclass: UIView {
    
    // MARK: Lifecycle methods
    
    override init(frame: CGRect) {
        
        // Initialize properties here
        super.init(frame: frame)
        // Call class methods here
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        // Initialize properties here
        super.init(coder: aDecoder)
        // Call class methods here
    }
    
    init(param: AnyObject, paramN: AnyObject) {
        
        // Initialize properties and use params here
        super.init(frame: CGRect.zero)
        // Call class methods here
    }
    
    convenience init(param1: AnyObject, paramN: AnyObject) {
        
        self.init(frame: CGRect.zero)
        // Initialize properties and use params here
        // Call class methods here
    }
}
