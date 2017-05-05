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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        addActivityIndicator()
    }
    
    fileprivate func addActivityIndicator() {
        
        let contentViewController = UIViewController.init()
        
        let activityView = UIActivityIndicatorView.init(frame: CGRect.zero)
        activityView.translatesAutoresizingMaskIntoConstraints = false
        activityView.activityIndicatorViewStyle = .gray
        
        contentViewController.view.addSubview(activityView)
        activityView.addCenterInSuperviewConstraints()
        activityView.startAnimating()
        
        contentViewController.view.addHeightConstraint(20)
        
        setValue(contentViewController, forKey: "contentViewController")
    }
}
