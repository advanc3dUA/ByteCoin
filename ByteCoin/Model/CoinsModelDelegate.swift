//
//  CoinsModelDelegate.swift
//  ByteCoin
//
//  Created by Yuriy Gudimov on 31.10.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinsModelDelegate {
    func didUpdatePrices(_ coinManager: CoinManager, coinsModel: CoinsModel)
    func didFailWithError(with error: Error)
}
