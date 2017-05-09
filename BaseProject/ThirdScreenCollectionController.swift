//
//  ThirdScreenCollectionController.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 08/05/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

class ThirdScreenCollectionController: NSObject, UICollectionViewDelegate, UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout  {
    
    fileprivate let itemsPerRow = 3
    fileprivate let minSpaceBetweenItems: CGFloat = 10
    
    fileprivate var collectionView: UICollectionView!
    fileprivate var delegate: ThirdScreenCollectionControllerDelegate?
    fileprivate var cellSize = CGSize(width: 0, height: 0)
    
    // MARK: - Lifecycle methods
    
    init(collectionView: UICollectionView,
         delegate: ThirdScreenCollectionControllerDelegate) {
        
        super.init()
        
        self.collectionView = collectionView
        self.delegate = delegate
        
        registerCells()
    }
    
    // MARK: - UICollectionViewDelegate methods
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.didSelectItem(atIndexPath: indexPath)
    }
    
    // MARK: - UICollectionViewDataSource methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let identifier = String(describing: ThirdScreenCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ThirdScreenCollectionViewCell
        cell.setupCell(withTitle: "Title \(indexPath.item)")
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout methods
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return getCellSize()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        /*
         (From Apple's Doc.)
         
         If you do not implement this method, the flow layout uses the value in its minimumInteritemSpacing property
         
         For a vertically scrolling grid, this value represents the minimum spacing between items in the same row. For a horizontally
         scrolling grid, this value represents the minimum spacing between items in the same column. This spacing is used to compute
         how many items can fit in a single line, but after the number of items is determined, the actual spacing may possibly be
         adjusted upward.
         */
        
        return minSpaceBetweenItems
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        /*
         (From Apple's Doc.)
         
         If you do not implement this method, the flow layout uses the value in its minimumLineSpacing property
         
         For a vertically scrolling grid, this value represents the minimum spacing between successive rows. For a horizontally 
         scrolling grid, this value represents the minimum spacing between successive columns. This spacing is not applied to the 
         space between the header and the first line or between the last line and the footer.
         */
        
        return minSpaceBetweenItems
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        /*
         (From Apple's Doc.)
         
         If you do not implement this method, the flow layout uses the value in its sectionInset property
         
         Section insets are margins applied only to the items in the section. They represent the distance between the header view 
         and the first line of items and between the last line of items and the footer view. They also indicate they spacing on 
         either side of a single line of items. They do not affect the size of the headers or footers themselves.
         */
        
        return UIEdgeInsetsMake(minSpaceBetweenItems, minSpaceBetweenItems, minSpaceBetweenItems, minSpaceBetweenItems)
    }
    
    // MARK: - Private methods
    
    fileprivate func registerCells() {
     
        let identifier = String(describing: ThirdScreenCollectionViewCell.self)
        let nib = UINib.init(nibName: identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    fileprivate func getCellSize() -> CGSize {
        
        if (cellSize.equalTo(CGSize.zero)) {
            cellSize = calculateSquareCellSize()
        }
        
        return cellSize
    }
    
    fileprivate func calculateSquareCellSize() -> CGSize {
        
        let collectionWidth = collectionView.frame.width

        let availableWidth = CGFloat(collectionWidth) - (CGFloat(itemsPerRow + 1) * minSpaceBetweenItems)
        let size = availableWidth / CGFloat(itemsPerRow)
        
        return CGSize(width: size, height: size)
    }
}
