//
//  ActivityAlertController.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 05/05/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

@objc class ActivityAlertController: UIAlertController {
    
    fileprivate var contentViewController: UIViewController?
    fileprivate var activityView: UIActivityIndicatorView?
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupAlert()
    }
    
    // MARK: - Private methods
    
    fileprivate func setupAlert() {
        
        addContentViewController()
        addActivityIndicator()
    }
    
    fileprivate func addContentViewController() {
        
        contentViewController = UIViewController.init()
        addConstraintsToContentView()

        setValue(contentViewController, forKey: "contentViewController")
    }
    
    fileprivate func addConstraintsToContentView() {
        
        contentViewController!.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[view(20)]",
                                                                                  options: [],
                                                                                  metrics: nil,
                                                                                  views: ["view": contentViewController!.view]))
    }
    
    fileprivate func addActivityIndicator() {
        
        activityView = UIActivityIndicatorView.init(frame: CGRect.zero)
        activityView!.translatesAutoresizingMaskIntoConstraints = false
        activityView!.activityIndicatorViewStyle = .gray
        activityView!.startAnimating()
        
        contentViewController?.view.addSubview(activityView!)
        
        addConstraintsToActivityIndicator()
    }
    
    fileprivate func addConstraintsToActivityIndicator() {

        let superview = activityView!.superview!
        activityView!.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        activityView!.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
}
