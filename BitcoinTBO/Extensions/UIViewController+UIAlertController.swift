//
//  UIViewController+UIAlertController.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 19.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import Foundation

extension UIViewController {
	
	func showSimpleAlertController(title: String? = nil, message: String) {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: "Accept", style: .default) { (action: UIAlertAction) in
			alertController.dismiss(animated: true, completion: nil)
		}
		
		alertController.addAction(action)
		self.present(alertController, animated: true, completion: nil)
	}
}
