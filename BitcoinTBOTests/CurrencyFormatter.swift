//
//  CurrencyFormatter.swift
//  BitcoinTBOTests
//
//  Created by Ramiro Ramirez on 20.11.19.
//  Copyright © 2019 Ramiro Ramirez. All rights reserved.
//

import XCTest

class CurrencyFormatter: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

	func testEuroFormattedStringShoulHaveEuroSymbol() {

		let value = Double(1400)
		let valueWithEuroFormat = value.currencyFormat(for: "EUR")
		XCTAssert((valueWithEuroFormat?.contains("€") == true), "The currency formatter does not work as expected")
	}

	func testEuroFormattedStringShouldEndsWithEuroSymbol() {

		let value = Double(1400)
		let valueWithEuroFormat = value.currencyFormat(for: "EUR")
		XCTAssert((valueWithEuroFormat?.last == "€"), "The currency formatter does not work as expected")
	}

	func testPoundFormattedStringShoulHavePoundSymbol() {

		let value = Double(1400)
		let valueWithEuroFormat = value.currencyFormat(for: "GBP")
		XCTAssert((valueWithEuroFormat?.contains("£") == true), "The currency formatter does not work as expected")
	}

	func testPoundFormattedStringShouldEndsWithPoundSymbol() {

		let value = Double(1400)
		let valueWithEuroFormat = value.currencyFormat(for: "GBP")
		XCTAssert((valueWithEuroFormat?.last == "£"), "The currency formatter does not work as expected")
	}

}
