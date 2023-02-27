//
//  TableView+Extention.swift
//  MVVM+C
//
//  Created by Tigran VIasyan on 23.02.23.
//

import Foundation
import UIKit


extension UITableView {
    func register(identifier: String) {
        self.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
}
