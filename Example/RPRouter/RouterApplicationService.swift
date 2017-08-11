//
//  RouterApplicationService.swift
//  RPRouter
//
//  Created by Florian PETIT on 04/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import PluggableApplicationDelegate
import Compass
import RPRouter

class RouterApplicationService: NSObject, ApplicationService {
    
    override init() {
        super.init()
        configure()
    }
    
    func configure() {
        Navigator.scheme = "router"
        Navigator.routes = ["test:{title}"]
        let routes = ["test:{title}" : TestRoute()]
        RPRouter.sharedInstance.configureRouting(with: routes)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if let url = launchOptions?[.url] as? URL, let navigationController = UIApplication.shared.delegate?.window??.rootViewController as? UINavigationController {
            _ = RPRouter.sharedInstance.handle(url, from: navigationController.viewControllers.first!)
        }
        
        if let shortcutItem =
            launchOptions?[.shortcutItem]
                as? UIApplicationShortcutItem {
            
            handleShortcut(shortcutItem: shortcutItem)
            return false
        }

        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        guard let navigationController = UIApplication.shared.delegate?.window??.rootViewController as? UINavigationController else {
            return false
        }
        return RPRouter.sharedInstance.handle(url, from: navigationController.viewControllers.first!)
    }
    
    func application(application: UIApplication,
                     performActionForShortcutItem shortcutItem: UIApplicationShortcutItem,
                     completionHandler: (Bool) -> Void) {
        
        completionHandler(handleShortcut(shortcutItem: shortcutItem))
    }
    
    private func handleShortcut(shortcutItem: UIApplicationShortcutItem) -> Bool {
        guard let navigationController = UIApplication.shared.delegate?.window??.rootViewController as? UINavigationController else {
            return false
        }
        guard let urlString = shortcutItem.userInfo?["routing"]  else { return false }
        if let url = URL(string: urlString as! String) {
            RPRouter.sharedInstance.handle(url, from: navigationController.viewControllers.first!)
        }
        return true
    }


}
 
