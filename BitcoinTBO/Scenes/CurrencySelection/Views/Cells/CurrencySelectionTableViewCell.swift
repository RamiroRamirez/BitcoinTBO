//
//  CurrencySelectionTableViewCell.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 20.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import UIKit

class CurrencySelectionTableViewCell: UITableViewCell {

	func setupCell(title: String, isSelected: Bool) {
		self.textLabel?.text = title
		self.accessoryType = ((isSelected == true) ? .checkmark : .none)
	}
}
