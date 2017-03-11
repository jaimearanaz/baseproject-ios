//
//  FirstScreenViewControllerDelegate.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 07/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation

protocol FirstScreenViewControllerDelegate {
    
    func startLoadingState()
    
    func stopLoadingState()
    
    func showMessage(_ message: String)
}
