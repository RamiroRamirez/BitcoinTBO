//
//  Currency.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 21.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import Foundation

enum Currency: CaseIterable {

	case euro
	case dollar
	case pound

	var title: String {
		switch self {
		case .euro		: return "Euro"
		case .dollar	: return "Dollar"
		case .pound		: return "Pound"
		}
	}

	var isoCode: String {
		switch self {
		case .euro		: return "EUR"
		case .dollar	: return "USD"
		case .pound		: return "GBP"
		}
	}
}
