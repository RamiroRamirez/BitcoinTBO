//
//  CurrencySelectionViewController.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 20.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import UIKit

protocol CurrencySelectionDelegate: class {
	func didSelectCurrency()
}

class CurrencySelectionViewController			: UIViewController {

	// MARK: - Outlets

	@IBOutlet private weak var tableView		: UITableView!

	// MARK: - Properties

	var bitcoinEuroDataSource					= CurrencySelectionDataSource()
	weak var delegate							: CurrencySelectionDelegate?

	// MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

		self.setupTableView()
    }
}

// MARK: - Setup Methods

extension CurrencySelectionViewController {

	private func setupTableView() {
		self.tableView.dataSource = self.bitcoinEuroDataSource
		self.tableView.register(UINib(nibName: Constants.Cells.nibName.currencySelectionTableViewCell.rawValue, bundle: nil), forCellReuseIdentifier: Constants.Cells.reuseIdentifier.currencySelectionTableViewCell.rawValue)
		self.tableView.reloadData()
		self.tableView.delegate = self
	}
}

// MARK: - Implementation UITableViewDelegate Protocol

extension CurrencySelectionViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)

		guard let currency = self.bitcoinEuroDataSource.currencies[safe: indexPath.row] else {
			return
		}

		CurrencySelectionManager.shared.changeSelectedCurrency(currency: currency)
		self.tableView.reloadData()
		self.delegate?.didSelectCurrency()
	}
}
