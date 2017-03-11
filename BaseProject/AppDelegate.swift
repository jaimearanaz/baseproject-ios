//
//  AppDelegate.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 07/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let presenterInstances = PresenterInstances()
        let router = Router()
        let dataSource = DataSource()
        
        DispatchQueue.global().async {
            self.setupHeavyResources(dataSource: dataSource)
        }
        
        presenterInstances.setupPresenterInstances(router: router, dataSource: dataSource)
        router.setupRouter(presenterInstances: presenterInstances)
        
        let windowFrame = UIScreen.main.bounds
        window = UIWindow(frame: windowFrame)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = router.navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    // MARK: - Private methods
    
    fileprivate func setupHeavyResources(dataSource: DataSource) {
        
        let webServices = WebServices()
        let defaults = Defaults()
        
        dataSource.setupDataSource(withWebServices: webServices, defaults: defaults)
    }
}
