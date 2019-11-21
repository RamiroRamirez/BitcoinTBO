//
//  CurrentBitcoinInfosViewController.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 19.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import UIKit

class CurrentBitcoinInfosViewController: UIViewController {
	
	// MARK: - Outlets
	
	@IBOutlet private weak var currentBitcoinValueLabel	: UILabel!
	
	// MARK: - Properties
	
	var fetchCurrentBitcoinInformationTimer				: Timer?

	// MARK: - View Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.fetchCurrentBitcoinInformation()
		self.setTimerForRequest()
	}

	func reloadData() {
		self.fetchCurrentBitcoinInformationTimer?.invalidate()
		self.fetchCurrentBitcoinInformation()
		self.setTimerForRequest()
	}
	
	deinit {
		self.fetchCurrentBitcoinInformationTimer?.invalidate()
	}
	
	private func setTimerForRequest() {
		self.fetchCurrentBitcoinInformationTimer?.invalidate()
		self.fetchCurrentBitcoinInformationTimer = Timer.scheduledTimer(timeInterval: 30.0, target: self, selector: #selector(self.fetchCurrentBitcoinInformation), userInfo: nil, repeats: true)
	}
}

// MARK: - Fetch Methods

extension CurrentBitcoinInfosViewController {
	
	@objc
	private func fetchCurrentBitcoinInformation() {
		BitcoinInformationManager.fetchCurrentBitcoinInformation { [weak self] (bitcoin: Bitcoin?, error: Error?) in
			DispatchQueue.main.async {
				self?.showCurrentBitcoinInformation(error: error, bitcoin: bitcoin)
			}
		}
	}
}

extension CurrentBitcoinInfosViewController {
	
	private func showCurrentBitcoinInformation(error: Error?, bitcoin: Bitcoin?) {
		if let error = error {
			self.showSimpleAlertController(message: error.localizedDescription)
			return
		}

		var bitcoinValue: Double?
		switch CurrencySelectionManager.shared.currentCurrency {
		case .dollar	: bitcoinValue = bitcoin?.valueInDollars
		case .euro		: bitcoinValue = bitcoin?.valueInEuros
		case .pound		: bitcoinValue = bitcoin?.valueInPounds
		}
		
		guard
			let bitcoinValueInEuros = bitcoinValue,
			let bitcoinValueInEurosString = bitcoinValueInEuros.currencyFormat(for: CurrencySelectionManager.shared.currentCurrency.isoCode) else {
				self.showSimpleAlertController(message: APIManager.Invalid.format.localizedError.localizedDescription)
				return
		}
		
		self.currentBitcoinValueLabel.text = "\(NSLocalizedString("Current.Bitcoin.Value", comment: "")) \(bitcoinValueInEurosString)"
	}
}
