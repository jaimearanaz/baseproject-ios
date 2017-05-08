//
//  UIAlertController+ProgressView.swift
//  BaseProject
//
//  Created by Jaime on 30/04/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

class ProgressAlertController: UIAlertController {
    
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
        addConstraintisToContentView()
        
        setValue(contentViewController, forKey: "contentViewController")
    }
    
    fileprivate func addProgresBarView() {
        
        progressView = UIProgressView(frame: CGRect.zero)
        progressView!.translatesAutoresizingMaskIntoConstraints = false
        progressView!.backgroundColor = UIColor.lightGray
        progressView!.tintColor = UIColor.black
        
        contentViewController!.view.addSubview(progressView!)
        
        addConstraintsToProgressView()
    }
    
    fileprivate func addConstraintisToContentView() {
        
        contentViewController?.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[view(10)]",
                                                                                  options: [],
                                                                                  metrics: nil,
                                                                                  views: ["view": contentViewController!.view]))
    }
    
    fileprivate func addConstraintsToProgressView() {

        let superview = progressView!.superview!

        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[progressView]-10-|",
                                       options: [],
                                       metrics: nil,
                                       views: ["progressView": progressView!]))
        
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[progressView(2)]",
                                                         options: [],
                                                         metrics: nil,
                                                         views: ["progressView": progressView!]))
        
        progressView!.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        progressView!.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
}
