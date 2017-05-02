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
    
    fileprivate var progressView: UIProgressView?
    fileprivate var margin: CGFloat = 8.0
    
    // MARK: Lifecycle methods
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
        addProgressBarIfNeeded()
    }
    
    // MARK: Public methods
    
    func setProgress(_ progress: CGFloat) {
        
        self.progressView?.setProgress(Float(progress), animated: true)
    }
    
    // MARK: Private methods
    
    fileprivate func addProgressBarIfNeeded() {
        
        guard (self.progressView == nil) else {
            return
        }
        
        let rect = CGRect(x: margin,
                          y: view.frame.size.height - margin,
                          width: view.frame.width - margin * 2.0 ,
                          height: 2.0)
        self.progressView = UIProgressView(frame: rect)
        self.progressView!.backgroundColor = UIColor.lightGray
        self.progressView!.progress = 0.0
        self.progressView!.tintColor = UIColor.black
        
        view.addSubview(self.progressView!)
    }
}
