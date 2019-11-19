//
//  Array+SafeIndex.swift
//  BitcoinTBO
//
//  Created by Ramiro Ramirez on 19.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import Foundation

extension Array {

	/// Bounds-checked ("safe") index lookup for Arrays.
	/// Example usage:
	/// let foo = [0,1,2][safe: 1]    |    foo = (Int?) 1
	/// let bar = [0,1,2][safe: 10]    |    bar = (Int?) nil
	subscript (safe index: Int) -> Element? {
		return ((self.indices ~= index) ? self[index] : nil)
	}
}
