//
//  SecondScreenTableDelegates.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 07/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

class SecondScreenTableController: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var products = [Product]()
    
    fileprivate var tableView: UITableView?
    fileprivate var delegate: SecondScreenTableControllerDelegate?
    
    let cellHeight: CGFloat = 80
    
    // MARK: - Lifecycle methods

    init(tableView: UITableView, delegate: SecondScreenTableControllerDelegate) {
        
        self.tableView = tableView
        self.delegate = delegate
        
        let identifier = String(describing: SecondScreenTableViewCell.self)
        let nib = UINib.init(nibName: identifier, bundle: nil)
        self.tableView?.register(nib, forCellReuseIdentifier: identifier)
    }

    // MARK: - UITableViewDataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = String(describing: SecondScreenTableViewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SecondScreenTableViewCell
        let product = products[indexPath.row]
        cell.setupCell(withProduct: product)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        delegate?.didSelectRow(atIndex: indexPath)
    }
}
