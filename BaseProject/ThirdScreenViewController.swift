//
//  ThirdScreenViewController.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 08/05/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

class ThirdScreenViewController: BaseViewController, ThirdScreenViewControllerDelegate, ThirdScreenCollectionControllerDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    fileprivate var presenterDelegate: ThirdScreenPresenterDelegate?
    fileprivate var collectionViewDelegate: ThirdScreenCollectionController?
    
    // MARK: - Lifecycle methods

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        setupCollectionViewIfReady()
    }
    
    // MARK: - Private methods
    
    fileprivate func setupCollectionViewIfReady() {
        
        let hasData = true
        let ready = (collectionView != nil) && hasData
        
        if (ready) {
            setupCollectionView()
        }
    }
    
    fileprivate func setupCollectionView() {
        
        collectionViewDelegate = ThirdScreenCollectionController(collectionView: collectionView!, delegate: self)
        collectionView.delegate = collectionViewDelegate
        collectionView.dataSource = collectionViewDelegate
        collectionView.reloadData()
    }
}
