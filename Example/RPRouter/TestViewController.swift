//
//  ViewController.swift
//  RPRouter
//
//  Created by mrcloud on 08/04/2017.
//  Copyright (c) 2017 mrcloud. All rights reserved.
//

import UIKit
import Compass
import RPRouter

struct TestRoute : Routable {
    
    func navigate(to location: Location, from currentController: CurrentController) throws {
        guard let title = location.arguments["title"] else { return }
        
        let testViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TestViewController")
        testViewController.title = title
        currentController.navigationController?.pushViewController(testViewController, animated: true)
    }
}

class TestViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func navigateAction(_ sender: Any) {
        guard let text = titleTextField.text, text.characters.count > 0 else {
            return
        }
        RPRouter.sharedInstance.navigate(to: "test:\(text)", from: self)
    }
}

