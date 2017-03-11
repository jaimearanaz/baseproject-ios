//
//  SecondScreenViewController.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 07/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

class SecondScreenViewController: UIViewController, SecondScreenViewControllerDelegate, SecondScreenTableListener {
 
    @IBOutlet var tableView: UITableView!
    
    var tableDelegate: SecondScreenTableDelegates?
    
    fileprivate var presenterDelegate: SecondScreenPresenterDelegate?
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableDelegate = SecondScreenTableDelegates(tableView: tableView, listener: self)
        tableView.delegate = tableDelegate
        tableView.dataSource = tableDelegate
    }
    
    // MARK: - Public methods
    
    func setupViewController(presenterDelegate: SecondScreenPresenterDelegate) {
        
        self.presenterDelegate = presenterDelegate
    }
    
    // MARK: - Action methods
    
    @IBAction func didSelectSortType(sender: AnyObject) {
        
        let segmentedControl = sender as! UISegmentedControl
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            presenterDelegate?.didSelectSortByName()
            break
        case 1:
            presenterDelegate?.didSelectSortByBrand()
            break
        default:
            presenterDelegate?.didSelectSortByPrice()
        }
    }
    
    // MARK: - SecondScreenTableListener methods
    
    func didSelectRow(atIndex index: IndexPath) {
        
        // TODO: implement
    }
    
    // MARK: - SecondScreenViewControllerDelegate methods
    
    func showProducts(_ products: [Product]) {
        
        tableDelegate?.products = products
        tableView.reloadData()
    }
}
