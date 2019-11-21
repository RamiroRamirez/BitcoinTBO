//
//  CurrencySelectionManager.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 20.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import Foundation

class CurrencySelectionManager {

	static let shared		= CurrencySelectionManager()

	private var selectedCurrency	: Currency = .euro

	var currentCurrency: Currency {
		return self.selectedCurrency
	}

	private init() {
	}

	func changeSelectedCurrency(currency: Currency) {
		self.selectedCurrency = currency
	}
}
