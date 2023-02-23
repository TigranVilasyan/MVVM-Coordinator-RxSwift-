//
//  AppCoordinator.swift
//  MVVM+C
//
//  Created by Tigran VIasyan on 17.02.23.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var window: UIWindow?
    var windowScene: UIWindowScene?
    var childCoordinators = [Coordinator]()
    
    func execute(step: CoordinatorStepType) -> Bool {
        guard let appStep = step as? AppStep else { return false }
        switch appStep {
        case .root:     loadFirstViewController()
        }
        return true
    }
    
    
    var navBar = UINavigationController(nibName: nil, bundle: nil)
    
    func loadFirstViewController() {
        let vc = Dependency.shared.resolver.resolve(FirstViewController.self)!
        guard let windowScene = windowScene else { return}
        let window = UIWindow(windowScene: windowScene)
        navBar = UINavigationController(rootViewController: vc)
        window.rootViewController = navBar
        self.window = window
        window.makeKeyAndVisible()
    }
}
