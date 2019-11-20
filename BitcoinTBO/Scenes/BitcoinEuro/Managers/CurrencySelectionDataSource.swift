//
//  CurrencySelectionDataSource.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 20.11.19.
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

class CurrencySelectionDataSource: NSObject {
}

extension CurrencySelectionDataSource: UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return Currency.allCases.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard
			let currency = Currency.allCases[safe: indexPath.row],
			let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.reuseIdentifier.currencySelectionTableViewCell.rawValue) as? CurrencySelectionTableViewCell else {
				return UITableViewCell()
		}

		cell.setupCell(title: currency.title)
		return cell
	}
}
