//
//  BitcoinEurosContainerViewController.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 19.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import UIKit

class BitcoinEurosContainerViewController						: UIViewController {

	// MARK: - Outlets

	@IBOutlet private weak var currentBitcoinViewConstraint		: NSLayoutConstraint!

	// MARK: - Computed Properties

	var isCurrentBitcoinInfosViewVisible: Bool {
		(self.currentBitcoinViewConstraint.constant != 0)
	}

	// MARK: - General UI Helpers

	func changeCurrentBitcoinInformationViewVisibility(hide: Bool) {

		let currentBitcoinInfosViewController = self.children.first { (viewController: UIViewController) -> Bool in
			return (viewController is CurrentBitcoinInfosViewController)
		}

		guard
			let _currentBitcoinInfosViewController = currentBitcoinInfosViewController,
			(hide == self.isCurrentBitcoinInfosViewVisible) else {
				return
		}

		self.currentBitcoinViewConstraint.constant = ((hide == true) ? 0 : Constants.UI.currentBitcoinViewActiveHeight)

		UIView.animate(withDuration: 0.3) {
			_currentBitcoinInfosViewController.view.alpha = ((hide == true) ? 0 : 1)
			self.view.layoutIfNeeded()
		}
	}
}

// MARK: - Navigation

extension BitcoinEurosContainerViewController {

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if
			segue.identifier == Constants.Segues.toBitcoinEurosViewController.rawValue,
			let bitcoinEurosViewController = segue.destination as? BitcoinEurosViewController {
				bitcoinEurosViewController.changeCurrentBitcoinInformationViewVisibility = { [weak self] (hide: Bool) in
					self?.changeCurrentBitcoinInformationViewVisibility(hide: hide)
				}
		}
	}
}
