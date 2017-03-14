//
//  UIColor.swift
//  Amazonico
//
//  Created by Jaime Aranaz on 16/11/2016.
//  Copyright © 2016 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    // MARK: Public methods
    
    static func colorFromHex(_ hexString: String) -> UIColor {
        
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = hexString.substring(from: start)
            
            if hexColor.characters.count == 8 {
                
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    return UIColor(red: r, green: g, blue: b, alpha: a)
                }
            }
        }
        
        return UIColor.white
    }
}
