//
//  RoundedView.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 19.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import UIKit

class RoundedView: UIView {

	override func awakeFromNib() {
		super.awakeFromNib()
		
		self.layer.cornerRadius = 5
		self.layer.masksToBounds = true
	}
}
