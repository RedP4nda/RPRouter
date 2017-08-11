//
//  AppDelegate.swift
//  RPRouter
//
//  Created by mrcloud on 08/04/2017.
//  Copyright (c) 2017 mrcloud. All rights reserved.
//

import UIKit
import RPFramework
import PluggableApplicationDelegate

@UIApplicationMain
class AppDelegate: RPApplicationDelegate {
    
    override var services: [ApplicationService] {
        return [
            RouterApplicationService(),
        ]
    }
    
}
