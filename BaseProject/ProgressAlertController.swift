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
        contentViewController!.view.addHeightConstraint(10)
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
    
    fileprivate func addConstraintsToProgressView() {
        
        let height: CGFloat = 2
        let heightConstraint = NSLayoutConstraint(
            item: progressView!,
            attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: nil,
            attribute: NSLayoutAttribute.notAnAttribute,
            multiplier: 1,
            constant: height)
        progressView!.addConstraint(heightConstraint)
        
        let verticalCenterConstraint = NSLayoutConstraint(
            item: progressView!,
            attribute: NSLayoutAttribute.centerY,
            relatedBy: NSLayoutRelation.equal,
            toItem: progressView!.superview,
            attribute: NSLayoutAttribute.centerY,
            multiplier: 1,
            constant: 0)
        progressView!.superview!.addConstraint(verticalCenterConstraint)
        
        let horizontalCenterConstraint = NSLayoutConstraint(
            item: progressView!,
            attribute: NSLayoutAttribute.centerX,
            relatedBy: NSLayoutRelation.equal,
            toItem: progressView!.superview,
            attribute: NSLayoutAttribute.centerX,
            multiplier: 1,
            constant: 0)
        progressView!.superview!.addConstraint(horizontalCenterConstraint)
        
        let leading: CGFloat = -10
        let leadingConstraint = NSLayoutConstraint(
            item: progressView!.superview!,
            attribute: NSLayoutAttribute.leading,
            relatedBy: NSLayoutRelation.equal,
            toItem: progressView!,
            attribute: NSLayoutAttribute.leading,
            multiplier: 1,
            constant: leading)
        progressView!.superview!.addConstraint(leadingConstraint)
        
        let trailing: CGFloat = 10
        let trailingConstraint = NSLayoutConstraint(
            item: progressView!.superview!,
            attribute: NSLayoutAttribute.trailing,
            relatedBy: NSLayoutRelation.equal,
            toItem: progressView!,
            attribute: NSLayoutAttribute.trailing,
            multiplier: 1,
            constant: trailing)
        progressView!.superview!.addConstraint(trailingConstraint)
    }
}
