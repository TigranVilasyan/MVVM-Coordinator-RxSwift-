//
//  Controllers.swift
//  MVVM+C
//
//  Created by Tigran VIasyan on 18.02.23.
//

import Foundation
import UIKit

class Controllers {
    
    func firstViewController()-> FirstViewController {
        return Controllers.controllerAt("Main", identifier: "FirstViewController") as! FirstViewController
    }
}
extension Controllers {
    
    class func controllerAt(_ storyboardName: String, identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        controller.modalPresentationStyle = .fullScreen
        return controller
    }
    
}
