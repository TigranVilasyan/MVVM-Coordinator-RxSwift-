//
//  CoordinatorAssembly.swift
//  MVVM+C
//
//  Created by Tigran VIasyan on 18.02.23.
//

import Foundation
import Swinject

class CoordinatorAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Coordinator.self) { r in
            return AppCoordinator()
        }
    }
}
