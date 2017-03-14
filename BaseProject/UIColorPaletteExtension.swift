//
//  UIColorPaletteExtension.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 14/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static fileprivate var myCustomColor: String! {
        get {
            return "#04a186FF"
        }
    }
    
    // MARK: Public methods
    
    static func myAppCustomColor() -> UIColor {
        
        return colorFromHex(myCustomColor)
    }
}
