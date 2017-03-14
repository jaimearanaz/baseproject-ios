//
//  FirstScreenViewController.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 07/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

class FirstScreenViewController: UIViewController, FirstScreenViewControllerDelegate, CustomViewDelegate {
    
    @IBOutlet var customView: CustomView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    fileprivate var presenterDelegate: FirstScreenPresenterDelegate?
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        customView.delegate = self
    }
    
    // MARK: - Public methods
    
    func setupViewController(presenterDelegate: FirstScreenPresenterDelegate) {
        
        self.presenterDelegate = presenterDelegate
    }
    
    // MARK: - CustomViewDelegate methods
    
    func didSelectGetData() {
        
        presenterDelegate?.didSelectGo()
    }
    
    // MARK: - FirstScreenViewControllerDelegate methods
    
    func startLoadingState() {
        
        customView.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func stopLoadingState() {
        
        customView.isHidden = false
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    func showMessage(_ message: String) {

        UIAlertController.showAlert(inViewController: self,
                                    message: message,
                                    dismissTitle: NSLocalizedString("ACCEPT", comment: "Accept button"))
    }
}
