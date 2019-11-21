//
//  APIManagerTest.swift
//  BitcoinTBOTests
//
//  Created by Ramiro Ramirez on 21.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import XCTest

import Foundation
import UIKit
@testable import BitcoinTBO

class APIManagerTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testFetchBitcoinHistoricalInformationShouldSucceed() {

		let expectation = self.expectation(description: "testFetchLoginShouldSucceed")
		APIManagerMockTest.shared.filename = "UnitTestHistoryBitcoin"
		let bitcoinInformationManager = BitcoinInformationManager(apiManager: APIManagerMockTest.shared)
		bitcoinInformationManager.fetchBitcoinInformation { (bitcoinDayInformation: [BitcoinDayInformation], error: Error?) in
			XCTAssertTrue((bitcoinDayInformation.count == 17), "In fake answer, there was information for 17 days, something went wrong during parsing")
			expectation.fulfill()
		}

		self.waitForExpectations(timeout: 2.0, handler: nil)
	}

	func testFetchBitcoinInfosShouldSucceed() {

		let expectation = self.expectation(description: "testFetchLoginShouldSucceed")
		APIManagerMockTest.shared.filename = "UnitTestCurrentBitCoinInformation"
		let bitcoinInformationManager = BitcoinInformationManager(apiManager: APIManagerMockTest.shared)
		bitcoinInformationManager.fetchCurrentBitcoinInformation { (bitcoin: Bitcoin?, error: Error?) in
			XCTAssertTrue(bitcoin?.valueInDollars == 7572.53, "Bitcoin has not the value in dollars coming from fake answer")
			expectation.fulfill()
		}

		self.waitForExpectations(timeout: 2.0, handler: nil)
	}

}
