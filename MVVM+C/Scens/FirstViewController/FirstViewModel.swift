//
//  FirstViewModel.swift
//  MVVM+C
//
//  Created by Tigran VIasyan on 17.02.23.
//

import Foundation
import ReactiveSwift

protocol FirstViewModelInput: AnyObject {
    func viewDidLoad()
}

protocol FirstViewModelOutput: AnyObject {
    var nextView: MutableProperty<Bool> { get set }
}

protocol FirstViewModelType: AnyObject {
    var inputs: FirstViewModelInput { get }
    var outputs: FirstViewModelOutput { get }
}

class FirstViewModel: FirstViewModelOutput,
                      FirstViewModelInput,
                      FirstViewModelType {
    
    var nextView: MutableProperty<Bool> = MutableProperty(true)
    var coordinator: Coordinator!
    
    func viewDidLoad() {
    }
    
    var inputs: FirstViewModelInput { return self }
    
    var outputs: FirstViewModelOutput { return self }
    
    
}
