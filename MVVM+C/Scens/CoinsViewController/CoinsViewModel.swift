//
//  CoinsViewModel.swift
//  MVVM+C
//
//  Created by Tigran VIasyan on 17.02.23.
//

import Foundation
import ReactiveSwift
protocol CoinsViewModelInput: AnyObject {
    func viewDidLoad()
}

protocol CoinsViewModelOutput: AnyObject {
    var coins: MutableProperty<Coins?> { get set }
}

protocol CoinsViewModelType: AnyObject {
    var inputs: CoinsViewModelInput { get }
    var outputs: CoinsViewModelOutput { get }
}

class CoinsViewModel: CoinsViewModelOutput,
                      CoinsViewModelInput,
                      CoinsViewModelType {
    
    var coordinator: Coordinator!
    
    var inputs: CoinsViewModelInput { return self }
    var outputs: CoinsViewModelOutput { return self }
    
    var coins = MutableProperty<Coins?>(nil)

    func viewDidLoad() {
        getCoins()
    }
    
    func getCoins() {
        let query = CoinsRequestQuery()
        CoinsRequest().getCoins(query: query) { [weak self] (response, success, error) in
            guard let response = response else { return }
            self?.coins.value = response
        }
    }
}
