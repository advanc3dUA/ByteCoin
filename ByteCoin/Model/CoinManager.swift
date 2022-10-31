//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    //let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    //let baseURL = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids="
    let baseURL = "https://api.coingecko.com/api/v3/simple/price?vs_currencies=usd&ids=bitcoin,ethereum,binancecoin"
    
    var delegate: CoinsModelDelegate?
    
    let currencyArray = ["bitcoin", "ethereum", "binancecoin"]
    
    func getCoinsPrices() {
        guard let url = URL(string: baseURL) else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let prices = parseJSON(data) {
                    delegate?.didUpdatePrices(self, coinsModel: prices)
                }
            } else if let error = error {
                print(error.localizedDescription)
                return
            }
        }.resume()
    }
    
    private func parseJSON(_ cryptoData: Data) -> CoinsModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CurrencyData.self, from: cryptoData)
            let btcPrice = decodedData.bitcoin.usd
            let ethPrice = decodedData.ethereum.usd
            let bnbPrice = decodedData.binancecoin.usd
            
            let coins = CoinsModel(btc: btcPrice, eth: ethPrice, bnb: bnbPrice)
            return coins
        } catch {
            print(error.localizedDescription, "here")
        }
        return nil
    }
}
