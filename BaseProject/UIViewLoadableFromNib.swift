//
//  UIViewLoadableFromNib.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 14/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

class UIViewLoadableFromNib: UIView {
    
    @IBOutlet var view: UIView!
    
    // MARK: Lifecycle methods
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        nibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        nibSetup()
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        nibSetup()
    }
    
    fileprivate func nibSetup() {
        
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(view)
    }
    
    fileprivate func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return nibView
    }
}
