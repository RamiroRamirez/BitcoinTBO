//
//  BitcoinInformationManager.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 19.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import Foundation

struct BitcoinInformationManager {
    
    static func fetchBitcoinInformation(completion: ((_ bitcoinDayInformations: [BitcoinDayInformation], _ error: Error?) -> Void)?) {
        guard let url = URL(string: "https://min-api.cryptocompare.com/data/v2/histoday") else {
            return
        }

        let requestElements = APIManager.RequestElements(url: url, parameters: ["fsym": "BTC", "tsym": "EUR"], headers: nil)
        APIManager.get(requestElements: requestElements, success: { (responseData: Any?) in
            guard let data = responseData as? Data else {
                return
            }
            
            let bitcoinInformation = self.bitcoinInformation(from: data)
            completion?(bitcoinInformation.bitcoinDayInformations, bitcoinInformation.error)

        }, failure: { (error: Error) in
            completion?([], error)
        })
    }
    
    private static func bitcoinInformation(from data: Data) -> (bitcoinDayInformations: [BitcoinDayInformation], error: Error?) {
        do {
            let bitcoinData = try JSONDecoder().decode(BitcoinData.self, from: data)
            return (bitcoinDayInformations: bitcoinData.bitcoinSubdata.bitcoinDayInformations, error: nil)
            
        } catch let error {
            return (bitcoinDayInformations: [], error: error)
        }
    }
}

extension BitcoinInformationManager {
    
}
