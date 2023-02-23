//
//  ViewControllerAssembly.swift
//  MVVM+C
//
//  Created by Tigran VIasyan on 17.02.23.
//

import Foundation
import Swinject


class ViewControllerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(FirstViewController.self) { r in
            let vc = Controllers().firstViewController()
            vc.inject(viewModel: r.resolve(FirstViewModelType.self)!)
            return vc
        }
    }
}
