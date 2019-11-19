//
//  BitcoinEurosViewController.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 18.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import UIKit

class BitcoinEurosViewController			: UIViewController {
	
	// MARK: - Outlets
	
	@IBOutlet private weak var tableView	: BitcoinEuroTableView!
	
	// MARK: - Properties
	
	var bitcoinEuroDataSource				= BitcoinEuroDataSource()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.setupTableView()
		self.bitcoinEuroDataSource.fetchBitcoinInformations { [weak self] (error: Error?) in
			if let error = error {
				self?.showSimpleAlertController(message: error.localizedDescription)
				return
			}
			
			DispatchQueue.main.async {
				self?.tableView.reloadData()
			}
		}
	}
}

// MARK: - Setup Methods

extension BitcoinEurosViewController {
	
	private func setupTableView() {
		self.tableView.setupTableView(self.bitcoinEuroDataSource)
	}
}
