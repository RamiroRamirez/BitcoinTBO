//
//  Constants.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 19.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import Foundation

struct Constants {
    
    struct API {
		
		static let baseUrl		= URL(string: "https://min-api.cryptocompare.com/data")
		static let baseUrlV2	= URL(string: "https://min-api.cryptocompare.com/data/v2")
		
		enum Endpoint: String {
			case historicalDaily	= "histoday"
			case price				= "price"
		}
		
		enum Keys: String {
			case fsym 				= "fsym"
			case tsym 				= "tsym"
			case tsyms 				= "tsyms"
			case limit				= "limit"
		}
		
		enum Values: String {
			case bitcoin 			= "BTC"
			case euro				= "EUR"
		}

		static let historicalLimit	= 14
    }
}

extension Constants {
	
	struct Cells {
		
		enum nibName: String {
			case bitcoinInformationCell 		= "BitcoinInformationCell"
			case currencySelectionTableViewCell	= "CurrencySelectionTableViewCell"
		}
		
		enum reuseIdentifier: String {
			case bitcoinInformationCell 		= "BitcoinInformationCell"
			case currencySelectionTableViewCell	= "CurrencySelectionTableViewCell"
		}
	}

	enum Segues: String {

		case toCurrentBitcoinInfosViewController	= "toCurrentBitcoinInfosViewController"
		case toBitcoinEurosViewController			= "toBitcoinEurosViewController"
		case toCurrencySelectionViewController		= "toCurrencySelectionViewController"
	}
}

extension Constants {

	struct UI {
		static let currentBitcoinViewActiveHeight	: CGFloat = 70
	}
}
