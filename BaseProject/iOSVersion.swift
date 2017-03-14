//
//  iOSVersion.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 14/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import UIKit

public class IOSVersion {
    
    class func SYSTEM_VERSION_EQUAL_TO(version: NSString) -> Bool {
        return UIDevice.current.systemVersion.compare(version as String,
                                                              options: NSString.CompareOptions.numeric) == ComparisonResult.orderedSame
    }
    
    class func SYSTEM_VERSION_GREATER_THAN(version: NSString) -> Bool {
        return UIDevice.current.systemVersion.compare(version as String,
                                                              options: NSString.CompareOptions.numeric) == ComparisonResult.orderedDescending
    }
    
    class func SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(version: NSString) -> Bool {
        return UIDevice.current.systemVersion.compare(version as String,
                                                              options: NSString.CompareOptions.numeric) != ComparisonResult.orderedAscending
    }
    
    class func SYSTEM_VERSION_LESS_THAN(version: NSString) -> Bool {
        return UIDevice.current.systemVersion.compare(version as String,
                                                              options: NSString.CompareOptions.numeric) == ComparisonResult.orderedAscending
    }
    
    class func SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(version: NSString) -> Bool {
        return UIDevice.current.systemVersion.compare(version as String,
                                                              options: NSString.CompareOptions.numeric) != ComparisonResult.orderedDescending
    }
}
