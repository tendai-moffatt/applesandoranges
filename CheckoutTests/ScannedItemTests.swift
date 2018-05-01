//
//  ScannedItemTests.swift
//  CheckoutTests
//
//  Created by Tendai Moffatt on 01/05/2018.
//  Copyright © 2018 Tendai Moffatt. All rights reserved.
//

import XCTest

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
    
}
