//
//  WebServicesLogger.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 07/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation

class WebServicesLogger {
    
    // MARK: - Public methods
    
    static func logRequest(_ request: URLRequest) {
        
        if let url = request.url {
            var message = url.absoluteString
            if let body = request.httpBody {
                if let postMessage = String.init(data: body, encoding: String.Encoding.utf8) {
                    
                    message = message + "\n{\n" + postMessage + "\n}"
                }
            }
            PrettyLog.logMessage(message, type: .networkRequest)
        }
    }
    
    static func logResponse(_ data: Data) {
        
        if let json = String.init(data: data, encoding: String.Encoding.utf8) {
            PrettyLog.logMessage(json, type: .networkResponse)
        }
    }
    
    static func logErrorWithMessage(_ message: String, andCode code: Int) {
        
        let className = NSStringFromClass(self).components(separatedBy: ".").last
        let message = className! + ": " + message + ", code " + String(code)
        PrettyLog.logMessage(message, type: .networkError)
    }
    
    static func logErrorWithMessage(_ message: String) {
        
        logErrorWithMessage(message, andCode: 0)
    }
}
