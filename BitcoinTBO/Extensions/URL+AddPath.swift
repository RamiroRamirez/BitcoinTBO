//
//  URL+AddPath.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 19.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import Foundation

extension URL {
	
	func add(path component: String) -> URL {
		return self.appendingPathComponent(component)
	}
}
