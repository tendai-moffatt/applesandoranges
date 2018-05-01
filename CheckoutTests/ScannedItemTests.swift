//
//  ScannedItemTests.swift
//  CheckoutTests
//
//  Created by Tendai Moffatt on 01/05/2018.
//  Copyright © 2018 Tendai Moffatt. All rights reserved.
//

import XCTest
@testable import Checkout

class ScannedItemTests: XCTestCase {
    
    func testInitWithValidData() {
        let appleString = "apple"
        let uut = ScannedItem(rawValue: appleString)
        XCTAssert(uut == .apple, "Expected UUT to be initialized as .apple given valid input")
        
        let orangeString = "orange"
        let uut2 = ScannedItem(rawValue: orangeString)
        XCTAssert(uut2 == .orange, "Expected UUT to be initialized as .orange given valid input")
    }
    
    func testInitWithBadData() {
        let badString = "banana"
        let uut = ScannedItem(rawValue: badString)
        XCTAssertNil(uut, "Expected UUT to be nil given bad input")
    }
    
    func testPrices() {
        let appleString = "apple"
        guard let uut = ScannedItem(rawValue: appleString) else {
            return XCTFail("Failed to init ScannedItem of type .apple")
        }
        XCTAssert(uut.price == 0.6, "Expected ScannedItem of type .apple to have a price of 0.6")
        
        let orangeString = "orange"
        guard let uut2 = ScannedItem(rawValue: orangeString) else {
            return XCTFail("Failed to init ScannedItem of type .orange")
        }
        XCTAssert(uut2.price == 0.25, "Expected ScannedItem of type .orange to have a price of 0.25")
    }
    
}
