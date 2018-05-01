//
//  ShoppingCartTests.swift
//  CheckoutTests
//
//  Created by Tendai Moffatt on 01/05/2018.
//  Copyright © 2018 Tendai Moffatt. All rights reserved.
//

import XCTest
@testable import Checkout

class ShoppingCartTests: XCTestCase {
    
    func testInitCartWithNoItems() {
        let uut = ShoppingCart()
        XCTAssert(uut.items.count == 0, "Expected to init ShoppingCart with no items")
    }
    
    func testInitCartWithItems() {
        let items: [ScannedItem] = [.apple, .orange]
        let uut = ShoppingCart(items: items)
        XCTAssert(uut.items.count == items.count, "Expected to init ShoppingCart with \(items.count) items")
    }
    
}
