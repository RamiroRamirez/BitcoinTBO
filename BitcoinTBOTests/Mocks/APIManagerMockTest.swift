//
//  APIManagerMockTest.swift
//  BitcoinTBOTests
//
//  Created by Ramiro Ramirez on 21.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import Foundation
import XCTest

class APIManagerMockTest: APIManagerProtocol {

	static let shared = APIManagerMockTest()
	var filename = ""

	private init() {
	}
}

extension APIManagerMockTest {

	func get(requestElements: RequestElements, success: ((Any?) -> Void)?, failure: ((Error) -> Void)?) {
		guard let data = self.loadFile(fileName: self.filename) else {
			XCTFail("Mocked Data was not found in current bundle")
			return
		}

		success?(data)
	}

	private func loadFile(fileName: String) -> Data? {
		let bundle = Bundle(for: type(of: self))
		guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
			return nil
		}

		return try? Data(contentsOf: url)
	}
}

