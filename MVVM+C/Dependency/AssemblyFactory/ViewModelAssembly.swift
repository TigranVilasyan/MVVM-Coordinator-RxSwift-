//
//  ViewModelAssembly.swift
//  MVVM+C
//
//  Created by Tigran VIasyan on 17.02.23.
//

import Foundation
import Swinject

class ViewModelAssemly: Assembly {
    func assemble(container: Container) {
        container.register(CoinsViewModelType.self) { r in
            let vm = CoinsViewModel()
            vm.coordinator = r.resolve(Coordinator.self)!
            return vm
        }
    }
}
