//
//  CurrencyData.swift
//  ByteCoin
//
//  Created by Yuriy Gudimov on 31.10.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CurrencyData: Codable {
    let bitcoin: Currency
    let ethereum: Currency
    let binancecoin: Currency
}

struct Currency: Codable {
    let usd: Double
}
