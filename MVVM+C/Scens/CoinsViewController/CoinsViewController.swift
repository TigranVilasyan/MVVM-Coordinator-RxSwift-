//
//  CoinsViewController.swift
//  MVVM+C
//
//  Created by Tigran VIasyan on 17.02.23.
//

import UIKit

class CoinsViewController: UIViewController {
    
    var viewModel: CoinsViewModelType!
    var coins: Coins!
    
    @IBOutlet weak var tableView: UITableView!
    func inject(viewModel: CoinsViewModelType) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupTableView()
        viewModel.inputs.viewDidLoad()
    }
    
    func setupViewModel() {
        viewModel.outputs.coins.signal.observeValues({ coins in
            self.coins = coins
            self.tableView.reloadData()
        })
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(identifier: CoinsTableViewCell.identifier)
    }
}


extension CoinsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = coins?.data.coins.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinsTableViewCell.identifier, for: indexPath) as? CoinsTableViewCell else { return UITableViewCell() }
        cell.setup(coin: coins.data.coins[indexPath.row])
        return cell
    }
}

extension CoinsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(88)
    }
}
