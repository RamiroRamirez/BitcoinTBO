//
//  Double+EuroFormatter.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 19.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import Foundation

extension Double {

	func currencyFormat(for currencyCode: String) -> String? {
		let currencyFormatter = NumberFormatter()
		currencyFormatter.numberStyle = .currency
		currencyFormatter.currencyCode = currencyCode
		currencyFormatter.maximumFractionDigits = 2
		return currencyFormatter.string(from: NSNumber(value: self))
	}
}
