//
//  BitcoinInformationManager.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 19.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import Foundation

struct BitcoinInformationManager {
	
	/// Method to fetch bitcoin information
	/// - Parameter completion: completion containing array of BitcoinDayInformation objects and error when needed
    static func fetchBitcoinInformation(completion: ((_ bitcoinDayInformations: [BitcoinDayInformation], _ error: Error?) -> Void)?) {
		guard let url = Constants.API.baseUrlV2?.add(path: Constants.API.Endpoint.historicalDaily.rawValue) else {
			completion?([], APIManager.Invalid.format.localizedError)
            return
        }

		let parameters = [Constants.API.Keys.fsym.rawValue: Constants.API.Values.bitcoin.rawValue,
						  Constants.API.Keys.tsym.rawValue: Constants.API.Values.euro.rawValue]
		let requestElements = APIManager.RequestElements(url: url, parameters: parameters, headers: nil)
        
		APIManager.get(requestElements: requestElements, success: { (responseData: Any?) in
            guard let data = responseData as? Data else {
				completion?([], APIManager.Invalid.format.localizedError)
                return
            }
            
            let bitcoinInformation = self.bitcoinInformation(from: data)
            completion?(bitcoinInformation.bitcoinDayInformations, bitcoinInformation.error)

        }, failure: { (error: Error) in
            completion?([], error)
        })
    }
	
	static func fetchCurrentBitcoinInformation(completion: ((_ bitcoin: Bitcoin?, _ error: Error?) -> Void)?) {
		guard let url = Constants.API.baseUrl?.add(path: Constants.API.Endpoint.price.rawValue) else {
			completion?(nil, APIManager.Invalid.format.localizedError)
			return
		}
		
		let parameters = [Constants.API.Keys.fsym.rawValue: Constants.API.Values.bitcoin.rawValue,
						  Constants.API.Keys.tsyms.rawValue: Constants.API.Values.euro.rawValue]
		let requestElements = APIManager.RequestElements(url: url, parameters: parameters, headers: nil)
		
		APIManager.get(requestElements: requestElements, success: { (responseData: Any?) in
			guard let data = responseData as? Data else {
				completion?(nil, APIManager.Invalid.format.localizedError)
                return
            }
			
			let bitcoin = self.currentBitcoinInformation(from: data)
			completion?(bitcoin.bitcoin, nil)
		}, failure: { (error: Error) in
			completion?(nil, error)
		})
	}
}

extension BitcoinInformationManager {
	
	/// Method to decode json into bitcoin models
	/// - Parameter data: data received from request
    private static func bitcoinInformation(from data: Data) -> (bitcoinDayInformations: [BitcoinDayInformation], error: Error?) {
        do {
            let bitcoinData = try JSONDecoder().decode(BitcoinData.self, from: data)
            return (bitcoinDayInformations: bitcoinData.bitcoinSubdata.bitcoinDayInformations, error: nil)
        } catch let error {
            return (bitcoinDayInformations: [], error: error)
        }
    }
	
	private static func currentBitcoinInformation(from data: Data) -> (bitcoin: Bitcoin?, error: Error?) {
		do {
            let bitcoin = try JSONDecoder().decode(Bitcoin.self, from: data)
			return (bitcoin: bitcoin, error: nil)
        } catch let error {
            return (bitcoin: nil, error: error)
        }
	}
}
