//
//  BitcoinEurosViewController.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 18.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import UIKit

class BitcoinEurosViewController						: UIViewController {
	
	// MARK: - Outlets
	
	@IBOutlet private weak var tableView				: BitcoinEuroTableView!
	
	// MARK: - Properties
	
	var bitcoinEuroDataSource							= BitcoinEuroDataSource()
	var changeCurrentBitcoinInformationViewVisibility	: ((_ hide: Bool) -> Void)?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.setupTableView()
		self.fetchData()
	}

	func reloadData() {
		self.fetchData()
	}

	private func fetchData() {

		self.bitcoinEuroDataSource.fetchBitcoinInformations { [weak self] (error: Error?) in
			DispatchQueue.main.async {
				if let error = error {
					self?.showSimpleAlertController(message: error.localizedDescription)
					return
				}

				self?.tableView.reloadData()
			}
		}
	}
}

// MARK: - Setup Methods

extension BitcoinEurosViewController {
	
	private func setupTableView() {
		self.tableView.setupTableView(self.bitcoinEuroDataSource)
		self.tableView.delegate = self
	}
}

// MARK: - Implementation UITableViewDelegate Protocol

extension BitcoinEurosViewController: UITableViewDelegate {

	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let isCollectionViewScrollingDown = (scrollView.panGestureRecognizer.translation(in: scrollView).y < 0)
		self.changeCurrentBitcoinInformationViewVisibility?(isCollectionViewScrollingDown)
	}

}
