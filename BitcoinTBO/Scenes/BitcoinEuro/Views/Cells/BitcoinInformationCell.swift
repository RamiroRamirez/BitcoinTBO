//
//  BitcoinInformationCell.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 19.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import UIKit

class BitcoinInformationCell					: UITableViewCell {
	
	// MARK: - Outlets
	
	@IBOutlet private weak var dateLabel		: UILabel!
	@IBOutlet private weak var lowValueLabel	: UILabel!
	@IBOutlet private weak var highValueLabel	: UILabel!
	@IBOutlet private weak var closeValueLabel	: UILabel!

	override func prepareForReuse() {
		self.dateLabel.text = nil
		self.lowValueLabel.text = nil
		self.highValueLabel.text = nil
		self.closeValueLabel.text = nil
	}
}

// MARK: - Setup Methods

extension BitcoinInformationCell {
	
	func setupCell(bitcoinDayInformation: BitcoinDayInformation, dateFormatter: DateFormatter) {
		let currencyISOCode = CurrencySelectionManager.shared.currentCurrency.isoCode
		self.lowValueLabel.text = bitcoinDayInformation.low.currencyFormat(for: currencyISOCode)
		self.highValueLabel.text = bitcoinDayInformation.high.currencyFormat(for: currencyISOCode)
		self.closeValueLabel.text = bitcoinDayInformation.close.currencyFormat(for: currencyISOCode)
		
		let date = Date(timeIntervalSince1970: bitcoinDayInformation.time)
		dateFormatter.dateStyle = .medium
		self.dateLabel.text = dateFormatter.string(from: date)
	}
}
