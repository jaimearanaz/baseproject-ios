//
//  FirstScreenViewController.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 07/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

class FirstScreenViewController: UIViewController, FirstScreenViewControllerDelegate {
    
    fileprivate var presenterDelegate: FirstScreenPresenterDelegate?
    
    // MARK: - Public methods
    
    func setupViewController(presenterDelegate: FirstScreenPresenterDelegate) {
        
        self.presenterDelegate = presenterDelegate
    }

    // MARK: - Action methods
    
    @IBAction func didSelectGo() {
    
        presenterDelegate?.didSelectGo()
    }
    
    // MARK: - FirstScreenViewControllerDelegate methods
    
    func startLoadingState() {
        
        // TODO: implement
    }
    
    func stopLoadingState() {
        
        // TODO: implement
    }
    
    func showMessage(_ message: String) {

        UIAlertController.showAlert(inViewController: self,
                                    message: message,
                                    dismissTitle: NSLocalizedString("ACCEPT", comment: "Accept button"))
    }
}
