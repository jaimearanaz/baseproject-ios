//
//  CustomView.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 14/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

class CustomView: UIViewLoadableFromNib {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var button: UIButton!
    
    var delegate: CustomViewDelegate?
    
    // MARK: - Action methods
    
    @IBAction func didSelectGetData() {
        
        delegate?.didSelectGetData()
    }
}
