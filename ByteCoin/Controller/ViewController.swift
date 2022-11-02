//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var priceLabel: UILabel!
    
    var coinManager = CoinManager()
    var coinsModel: CoinsModel?
    var refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
        
        coinManager.getCoinsPrices()
        
        refreshControl.attributedTitle = NSAttributedString(string: "pull to refresh")
        refreshControl.addTarget(self, action: #selector(updatePrices), for: .valueChanged)
        scrollView.addSubview(refreshControl)
    }
    
    func updateUI(with selectedCoinNumber: Int) {
        if let priceSelected = coinsModel?.coinsPrices[selectedCoinNumber] {
            let priceString = String(format: "%.2f", priceSelected)
            DispatchQueue.main.async {
                self.priceLabel.text = priceString
            }
        }
    }
    
    @objc private func updatePrices() {
        coinManager.getCoinsPrices()
        refreshControl.endRefreshing()
        currencyPicker.selectRow(0, inComponent: 0, animated: true)
    }
}

