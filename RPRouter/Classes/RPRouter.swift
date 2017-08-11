//
//  RPRouter.swift
//  RPRouter
//
//  Created by Florian PETIT on 04/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import Compass

public class RPRouter: NSObject {

    public static let sharedInstance = RPRouter()
    fileprivate var router = Router()
        
    public func configureRouting(with routes: [String : Routable]){
        router.routes = routes
    }
    
    public func navigate(to urn: String, from viewController: CurrentController) {
        let stringUrl = "\(Navigator.scheme)\(urn)"
        guard let url = URL(string: stringUrl) else { return }
        
       _ = handle(url, from: viewController)
    }
    
    public func handle(_ url: URL, from viewController: CurrentController) -> Bool {
        guard let location = Navigator.parse(url: url) else {
            return false
        }
        router.navigate(to: location, from: viewController)
        return true
    }
}
