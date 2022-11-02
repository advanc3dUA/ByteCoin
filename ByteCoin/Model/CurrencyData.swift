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
    let chia: Currency
    let cosmos: Currency
    let polkastarter: Currency
    let polkadot: Currency
    let cake: Currency
    let flow: Currency
    let matic: Currency
    let near: Currency
    let mina: Currency
    
    enum CodingKeys: String, CodingKey {
        case bitcoin
        case ethereum
        case binancecoin
        case chia
        case cosmos
        case polkastarter
        case polkadot
        case cake = "pancakeswap-token"
        case flow
        case matic = "matic-network"
        case near
        case mina = "mina-protocol"
    }
}

struct Currency: Codable {
    let usd: Double
}
