//
//  InternetWatcher.swift
//  DigitalRetailBuy
//
//  Created by Jaime Aranaz on 28/02/2017.
//  Copyright © 2017 Corpora360. All rights reserved.
//

import Foundation
import Reachability
import UIKit

protocol NetworkObserverDelegate : class {
    
    func internetAvailable()
    
    func internetNotAvailable()
}

class NetworkObserver {
    
    static fileprivate let reachability = Reachability.forInternetConnection()
    static fileprivate var observers = [NetworkObserverDelegate]()
    
    // MARK: - Public methods
    
    static func addObserver(_ observer: NetworkObserverDelegate) {
        
        observers.append(observer)
        startWatchingIfNeeded()
    }
    
    static func removeObserver(_ observer: NetworkObserverDelegate) {
        
        var index = 0
        for oneObserver in observers {
            if (oneObserver === observer) {
                observers.remove(at: index)
            }
            index += 1
        }
        
        stopWatchingIfNeeded()
    }
    
    static func isInternetAvailable() -> Bool {

        return (reachability?.isReachable())!
    }
    
    // MARK: - Private methods
    
    static fileprivate func startWatchingIfNeeded() {
        
        let firstObserverAdded = (observers.count == 1)
        if (firstObserverAdded) {
            
            reachability?.reachableBlock = {(reach: Reachability?) -> Void in
                notifyAvailabilityToObservers()
            }
            
            reachability?.unreachableBlock = {(reach: Reachability?) -> Void in
                notifyNoNetworkToObservers()
            }
            
            reachability?.startNotifier()
        }
    }
    
    static fileprivate func stopWatchingIfNeeded() {
        
        if (observers.count == 0) {
            reachability?.stopNotifier()
        }
    }
    
    static fileprivate func notifyAvailabilityToObservers() {
        
        DispatchQueue.main.async {
            for oneDelegate in observers {
                oneDelegate.internetAvailable()
            }
        }
    }
    
    static fileprivate func notifyNoNetworkToObservers() {
        
        DispatchQueue.main.async {
            for oneDelegate in observers {
                oneDelegate.internetNotAvailable()
            }
        }
    }
}
