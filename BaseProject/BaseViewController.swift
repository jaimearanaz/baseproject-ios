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
    
    // MARK: - BaseViewControllerDelegate methods
    
    func showAlert(title: String = "", message: String, actionTitle: String, actionHandler: @escaping (() -> Void) = {}) {
    
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let action = UIAlertAction(title: actionTitle, style: .default) { (action) in
            actionHandler()
        }
        
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    func showAlert(title: String = "",
                   message: String,
                   leftActionTitle: String,
                   leftActionHandler: @escaping (() -> Void) = {},
                   rightActionTitle: String,
                   rightActionHandler: @escaping (() -> Void)) {
    
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let rightAction = UIAlertAction(title: leftActionTitle, style: .default) { (action) in
            leftActionHandler()
        }
        
        let leftAction = UIAlertAction(title: rightActionTitle, style: .default) { (action) in
            rightActionHandler()
        }
        
        alertController.addAction(rightAction)
        alertController.addAction(leftAction)
        present(alertController, animated: true)
    }
}
