//
//  CoinsTableViewCell.swift
//  MVVM+C
//
//  Created by Tigran VIasyan on 23.02.23.
//

import UIKit
import SDWebImage

class CoinsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cryptoCoinPrice: UILabel!
    @IBOutlet weak var cryptoCoinNameLabel: UILabel!
    @IBOutlet weak var cryptoCoinImageView: UIImageView!
    static var identifier = "CoinsTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(coin: Coin) {
        self.cryptoCoinPrice.text = coin.price
        self.cryptoCoinNameLabel.text = coin.symbol
        self.cryptoCoinImageView.sd_setImage(with: URL(string: coin.iconURL))
        
    }
    
}
