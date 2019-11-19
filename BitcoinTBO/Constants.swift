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
		
		static let baseUrl = URL(string: "https://min-api.cryptocompare.com/data/v2")
		
		enum Endpoint: String {
			case historicalDaily = "histoday"
		}
		
		enum Keys: String {
			case fsym 		= "fsym"
			case tsym 		= "tsym"
		}
		
		enum Values: String {
			case bitcoin 	= "BTC"
			case euro		= "EUR"
		}
    }
	
	struct Cells {
		
		enum nibName: String {
			case bitcoinInformationCell = "BitcoinInformationCell"
		}
		
		enum reuseIdentifier: String {
			case bitcoinInformationCell = "BitcoinInformationCell"
		}
	}
}
