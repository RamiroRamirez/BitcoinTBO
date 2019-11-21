//
//  Bitcoin.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 19.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import Foundation

struct Bitcoin			: Codable {
	
	var valueInEuros	: Double?
	var valueInDollars	: Double?
	var valueInPounds	: Double?
	
	enum CodingKeys: String, CodingKey {
        case valueInEuros	= "EUR"
		case valueInDollars	= "USD"
		case valueInPounds	= "GBP"
    }
}
