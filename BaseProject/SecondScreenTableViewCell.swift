//
//  SecondScreenTableViewCell.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 07/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import SDWebImage
import UIKit

class SecondScreenTableViewCell: UITableViewCell {
    
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var brand: UILabel!
    @IBOutlet var price: UILabel!
    
    // MARK: - Public methods
    
    func setupCell(withProduct product: Product) {
        
        productImage.sd_setImage(with: URL(string: product.image)) { (image, error, cache, url) in
            print("cache \(cache.rawValue)")
        }
        
        name.text = product.name
        brand.text = product.brand
        price.text = product.price
    }
}
