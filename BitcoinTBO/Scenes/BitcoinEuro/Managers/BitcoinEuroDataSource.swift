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

extension BitcoinEuroDataSource {
    
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

@objc
extension BitcoinEuroDataSource: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.bitcoinDayInformations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard
			let bitcoinInformation = self.bitcoinDayInformations[safe: indexPath.row],
			let cell = tableView.dequeueReusableCell(withIdentifier: "BitcoinInformationCell") as? BitcoinInformationCell else {
				return UITableViewCell()
		}

		cell.setupCell(bitcoinDayInformation: bitcoinInformation, dateFormatter: self.dateFormatter)
		return cell
    }
}
