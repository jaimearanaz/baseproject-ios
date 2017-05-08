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
    @IBOutlet var tableButton: UIButton!
    @IBOutlet var collectionButton: UIButton!
    
    var delegate: CustomViewDelegate?
    
    // MARK: - Action methods
    
    @IBAction func didSelectTableButton() {
        
        delegate?.didSelectTableButton()
    }
    
    @IBAction func didSelectCollectionButton() {
        
        delegate?.didSelectCollectionButton()
    }
}
