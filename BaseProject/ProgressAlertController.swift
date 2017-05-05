//
//  UIAlertController+ProgressView.swift
//  BaseProject
//
//  Created by Jaime on 30/04/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

@objc class ProgressAlertController: UIAlertController {
    
    fileprivate var contentViewController: UIViewController?
    fileprivate var progressView: UIProgressView?
    
    // MARK: Lifecycle methods
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupProgressBar()
    }
    
    // MARK: Public methods
    
    func setProgress(_ progress: CGFloat) {
        
        self.progressView?.setProgress(Float(progress), animated: true)
    }
    
    // MARK: Private methods
    
    fileprivate func setupProgressBar() {
        
        addContentViewController()
        addProgresBarView()
    }
    
    fileprivate func addContentViewController() {
        
        contentViewController = UIViewController.init()
        contentViewController!.view.addHeightConstraint(10)
        setValue(contentViewController, forKey: "contentViewController")
    }
    
    fileprivate func addProgresBarView() {
        
        progressView = UIProgressView(frame: CGRect.zero)
        progressView!.translatesAutoresizingMaskIntoConstraints = false
        progressView!.backgroundColor = UIColor.lightGray
        progressView!.tintColor = UIColor.black
        
        contentViewController!.view.addSubview(progressView!)
        
        progressView!.addHeightConstraint(2)
        progressView!.addCenterVerticallyInSuperviewConstraint()
        progressView!.addLeadingSpaceToSuperviewConstraint(leadingSpace: -10)
        progressView!.addTrailingSpaceToSuperviewConstraint(trailingSpace: 10)
    }
}
