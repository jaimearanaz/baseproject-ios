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
    
    func showAlert(title: String,
                   message: String,
                   dismissTitle: String,
                   dismissHandler: @escaping (() -> Void),
                   actionTitle: String,
                   actionHandler: @escaping (() -> Void))
}

extension BaseViewControllerDelegate {
    
    func startLoadingState() {}
    
    func stopLoadingState() {}
}
