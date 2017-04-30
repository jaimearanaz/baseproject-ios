//
//  BaseViewControllerDelegate.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 14/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation

protocol BaseViewControllerDelegate {

    func startLoadingState()
    
    func stopLoadingState()
    
    func showAlert(title: String, message: String, actionTitle: String, actionHandler: @escaping (() -> Void))
    
    func showAlert(title: String,
                   message: String,
                   leftActionTitle: String,
                   leftActionHandler: @escaping (() -> Void),
                   rightActionTitle: String,
                   rightActionHandler: @escaping (() -> Void))
}

extension BaseViewControllerDelegate {
    
    func startLoadingState() {}
    
    func stopLoadingState() {}
    
    func showAlert(title: String = "", message: String, actionTitle: String, actionHandler: @escaping (() -> Void) = {}) {}
    
    func showAlert(title: String = "",
                   message: String,
                   leftActionTitle: String,
                   leftActionHandler: @escaping (() -> Void) = {},
                   rightActionTitle: String,
                   rightActionHandler: @escaping (() -> Void)) {}
}
