//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://api.coingecko.com/api/v3/simple/price?vs_currencies=usd&ids="
    
    var delegate: CoinsModelDelegate?
    
    let currencyArray = ["bitcoin", "ethereum", "binancecoin", "chia", "cosmos", "polkastarter", "polkadot", "pancakeswap-token", "flow", "matic-network", "near", "mina-protocol"]
    
    private func generateURL() -> URL? {
        var urlString = baseURL
        for currency in currencyArray {
            urlString += ",\(currency)"
        }
        guard let url = URL(string: urlString) else { return nil }
        return url
    }
    
    func getCoinsPrices() {
        guard let url = generateURL() else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let prices = parseJSON(data) {
                    delegate?.didUpdatePrices(self, coinsModel: prices)
                }
            } else if let error = error {
                delegate?.didFailWithError(with: error)
                return
            }
        }.resume()
    }
    
    private func parseJSON(_ cryptoData: Data) -> CoinsModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CurrencyData.self, from: cryptoData)
            
            var coins = CoinsModel()
            coins.coinsPrices.append(decodedData.bitcoin.usd)
            coins.coinsPrices.append(decodedData.ethereum.usd)
            coins.coinsPrices.append(decodedData.binancecoin.usd)
            coins.coinsPrices.append(decodedData.chia.usd)
            coins.coinsPrices.append(decodedData.cosmos.usd)
            coins.coinsPrices.append(decodedData.polkastarter.usd)
            coins.coinsPrices.append(decodedData.polkadot.usd)
            coins.coinsPrices.append(decodedData.cake.usd)
            coins.coinsPrices.append(decodedData.flow.usd)
            coins.coinsPrices.append(decodedData.matic.usd)
            coins.coinsPrices.append(decodedData.near.usd)
            coins.coinsPrices.append(decodedData.mina.usd)
            return coins
        } catch {
            delegate?.didFailWithError(with: error)
        }
        return nil
    }
}
