//
//  FirstViewController.swift
//  MVVM+C
//
//  Created by Tigran VIasyan on 17.02.23.
//

import UIKit

class FirstViewController: UIViewController {

    var viewModel: FirstViewModelType!
    
    
    func inject(viewModel: FirstViewModelType) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.inputs.viewDidLoad()
        let query = CoinsRequestQuery()
        let request = CoinsRequest().getCoins(query: query) { response, success, error in
            print(response)
        }
    }
}

