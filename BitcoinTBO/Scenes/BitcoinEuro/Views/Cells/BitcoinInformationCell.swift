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
}

// MARK: - Setup Methods

extension BitcoinInformationCell {
	
	func setupCell(bitcoinDayInformation: BitcoinDayInformation, dateFormatter: DateFormatter) {
		self.lowValueLabel.text = bitcoinDayInformation.low.formatAsEuroCurrency()
		self.highValueLabel.text = bitcoinDayInformation.high.formatAsEuroCurrency()
		self.closeValueLabel.text = bitcoinDayInformation.close.formatAsEuroCurrency()
		
		let date = Date(timeIntervalSince1970: bitcoinDayInformation.time)
		dateFormatter.dateStyle = .medium
		self.dateLabel.text = dateFormatter.string(from: date)
	}
}
