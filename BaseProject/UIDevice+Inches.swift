//
//  UIDevice+Inches.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 14/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
    
    static fileprivate var iPhone3dot5InchesHeight: CGFloat {
        get {
            return 480
        }
    }
    
    static fileprivate var iPhone4InchesHeight: CGFloat {
        get {
            return 568
        }
    }
    
    static fileprivate var iPhone4dot7InchesHeight: CGFloat {
        get {
            return 667
        }
    }
    
    static fileprivate var iPhone5dot5InchesHeight: CGFloat {
        get {
            return 736
        }
    }
    
    static fileprivate var iPhone5dot65InchesHeight: CGFloat {
        get {
            return 812
        }
    }
    
    // MARK: - Public methods
    
    static func isiPhone3dot5Inches() -> Bool {
        
        return (UIScreen.main.bounds.size.height == iPhone3dot5InchesHeight)
    }
    
    static func isiPhone4Inches() -> Bool {
        
        return (UIScreen.main.bounds.size.height == iPhone4InchesHeight)
    }
    
    static func isiPhone4dot7Inches() -> Bool {
        
        return (UIScreen.main.bounds.size.height == iPhone4dot7InchesHeight)
    }
    
    static func isiPhone5dot5Inches() -> Bool {
        
        return (UIScreen.main.bounds.size.height == iPhone5dot5InchesHeight)
    }
    
    static func iPhone5dot65Inches() -> Bool {
        
        return (UIScreen.main.bounds.size.height == iPhone5dot65InchesHeight)
    }
}

