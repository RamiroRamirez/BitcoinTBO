//
//  CurrencySelectionDataSource.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 20.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import Foundation

class CurrencySelectionDataSource	: NSObject {

	var currencies					= Currency.allCases
}

extension CurrencySelectionDataSource: UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.currencies.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard
			let currency = self.currencies[safe: indexPath.row],
			let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.reuseIdentifier.currencySelectionTableViewCell.rawValue) as? CurrencySelectionTableViewCell else {
				return UITableViewCell()
		}

		cell.setupCell(title: currency.title, isSelected: CurrencySelectionManager.shared.currentCurrency == currency)
		return cell
	}
}
