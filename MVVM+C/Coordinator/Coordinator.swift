//
//  Coordinator.swift
//  MVVM+C
//
//  Created by Tigran VIasyan on 17.02.23.
//

import Foundation
import UIKit

protocol CoordinatorStepType {
    
}

protocol Coordinator: AnyObject {

    var childCoordinators: [Coordinator] { get set }
    var window: UIWindow? { get set }
    var windowScene: UIWindowScene? { get set }
    
    func execute(step: CoordinatorStepType) -> Bool
}
