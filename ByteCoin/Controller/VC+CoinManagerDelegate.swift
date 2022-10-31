//
//  VC+CoinManagerDelegate.swift
//  ByteCoin
//
//  Created by Yuriy Gudimov on 31.10.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

extension ViewController: CoinsModelDelegate {
    func didUpdatePrices(_ coinManager: CoinManager, coinsModel: CoinsModel) {
        self.coinsModel = coinsModel
    }
    
    func didFailWithError(with error: Error) {
        print(error)
    }
}
