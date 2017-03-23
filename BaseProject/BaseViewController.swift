//
//  BaseViewController.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 14/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, BaseViewControllerDelegate {
    
    fileprivate var presenterDelegate: BasePresenterDelegate?
    
    // MARK: - Public methods
    
    func setupViewController(presenterDelegate: BasePresenterDelegate) {
        
        self.presenterDelegate = presenterDelegate
    }
    
    // MARK: - LoadingState methods
    
    func startLoadingState() {}
    
    func stopLoadingState() {}
    
    // MARK: - ViewControllerAlertable methods

    func showAlert(title: String = "",
                   message: String,
                   dismissTitle: String,
                   dismissHandler: @escaping (() -> Void) = {},
                   actionTitle: String = "",
                   actionHandler: @escaping (() -> Void) = {}) {
    
        UIAlertController.showAlert(inViewController: self,
                                    withTitle: title,
                                    message: message,
                                    dismissTitle: dismissTitle,
                                    dismissHandler: dismissHandler,
                                    actionTitle: actionTitle,
                                    actionHandler: actionHandler)
    }
}
