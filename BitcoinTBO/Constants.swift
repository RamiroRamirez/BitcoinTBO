//
//  Constants.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 19.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import Foundation

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
