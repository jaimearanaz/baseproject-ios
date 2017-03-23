//
//  SecondScreenViewController.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 07/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

class SecondScreenViewController: UIViewController, SecondScreenViewControllerDelegate, SecondScreenTableControllerDelegate {
 
    @IBOutlet var tableView: UITableView!
    
    var tableController: SecondScreenTableController?
    
    fileprivate var presenterDelegate: SecondScreenPresenterDelegate?
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableController = SecondScreenTableController(tableView: tableView, delegate: self)
        tableView.delegate = tableController
        tableView.dataSource = tableController
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
    
    // MARK: - SecondScreenTableControllerDelegate methods
    
    func didSelectRow(atIndex index: IndexPath) {
        
        // TODO: implement
    }
    
    // MARK: - SecondScreenViewControllerDelegate methods
    
    func showProducts(_ products: [Product]) {
        
        tableController?.products = products
        tableView.reloadData()
    }
}
