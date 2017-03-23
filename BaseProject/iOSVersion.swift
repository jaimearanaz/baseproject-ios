//
//  iOSVersion.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 14/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import UIKit

public class IOSVersion {
    
    class func equalTo(_ version: NSString) -> Bool {
        
        let result = UIDevice.current.systemVersion.compare(version as String, options: NSString.CompareOptions.numeric)
        return (result == ComparisonResult.orderedSame)
    }
    
    class func greaterThan(_ version: NSString) -> Bool {
        
        let result = UIDevice.current.systemVersion.compare(version as String, options: NSString.CompareOptions.numeric)
        return (result == ComparisonResult.orderedDescending)
    }
    
    class func greaterThanOrEqualTo(_ version: NSString) -> Bool {
        
        let result = UIDevice.current.systemVersion.compare(version as String, options: NSString.CompareOptions.numeric)
        return (result != ComparisonResult.orderedAscending)
    }
    
    class func lowerThan(_ version: NSString) -> Bool {
        
        let result = UIDevice.current.systemVersion.compare(version as String, options: NSString.CompareOptions.numeric)
        return (result == ComparisonResult.orderedAscending)
    }
    
    class func lowerThanOrEqualTo(_ version: NSString) -> Bool {
        
        let result = UIDevice.current.systemVersion.compare(version as String, options: NSString.CompareOptions.numeric)
        return (result != ComparisonResult.orderedDescending)
    }
}
