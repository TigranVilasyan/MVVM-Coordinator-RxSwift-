//
//  Dependency.swift
//  MVVM+C
//
//  Created by Tigran VIasyan on 17.02.23.
//

import Foundation
import Swinject

class Dependency {
  
    var assembler: Assembler!
    
    var resolver: Resolver {
        return assembler.resolver
    }
    
    static var shared: Dependency = {
        return Dependency()
    }()
    
    
    func initalize() {
        self.assembler = Assembler([
            
            //ViewModels
            ViewModelAssemly(),
            
            //ViewControllers
            ViewControllerAssembly(),
            
            //Other
            CoordinatorAssembly()
        ])
    }
}
