//
//  ThirdScreenCollectionViewCell.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 08/05/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

class ThirdScreenCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var titleView: UILabel!
 
    // MARK: - Lifecycle methods
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
    }
    
    // MARK: - Public methods
    
    func setupCell(withTitle title: String) {
 
        titleView.text = title
    }
}
