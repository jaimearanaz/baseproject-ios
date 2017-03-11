//
//  SecondScreenTableDelegates.swift
//  BaseProject
//
//  Created by Jaime on 07/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

class SecondScreenTableDelegates: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var products = [Product]()
    
    fileprivate var tableView: UITableView?
    fileprivate var listener: SecondScreenTableListener?
    
    let cellHeight: CGFloat = 80
    
    // MARK: - Lifecycle methods

    init(tableView: UITableView, listener: SecondScreenTableListener) {
        
        self.tableView = tableView
        self.listener = listener
        
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
     
        listener?.didSelectRow(atIndex: indexPath)
    }
}
