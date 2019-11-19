//
//  BitcoinEuroDataSource.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 18.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import UIKit

class BitcoinEuroDataSource         : NSObject {
    
    // MARK: - Properties
	
    var bitcoinDayInformations      = [BitcoinDayInformation]()
	var dateFormatter				= DateFormatter()
}

// MARK: - Fetchers

extension BitcoinEuroDataSource {
	
	/// Method to fetch Bitcoin information
	/// - Parameter completion: completion containing error when needed
    func fetchBitcoinInformations(completion: ((_ error: Error?) -> Void)?) {
        BitcoinInformationManager.fetchBitcoinInformation { (bitcoinDayInformations: [BitcoinDayInformation], error: Error?) in
            if let error = error {
                completion?(error)
            }
            
            self.bitcoinDayInformations = bitcoinDayInformations
            completion?(nil)
        }
    }
}

// MARK: - Implementation UITableViewDataSource Protocol

extension BitcoinEuroDataSource: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.bitcoinDayInformations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard
			let bitcoinInformation = self.bitcoinDayInformations[safe: indexPath.row],
			let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.reuseIdentifier.bitcoinInformationCell.rawValue) as? BitcoinInformationCell else {
				return UITableViewCell()
		}

		cell.setupCell(bitcoinDayInformation: bitcoinInformation, dateFormatter: self.dateFormatter)
		return cell
    }
}
