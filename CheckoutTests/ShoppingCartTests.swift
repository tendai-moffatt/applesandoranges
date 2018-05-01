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
        XCTAssert(uut.discounts.count == 0, "Expected to init ShoppingCart with no discounts")
    }
    
    func testInitCartWithItems() {
        let items: [ScannedItem] = [.apple, .orange]
        let uut = ShoppingCart(items: items)
        XCTAssert(uut.items.count == items.count, "Expected to init ShoppingCart with \(items.count) items")
        XCTAssert(uut.discounts.count == 0, "Expected to init ShoppingCart with no discounts")
    }
    
    func testInitCartWithDiscounts() {
        let discounts = [DiscountOffer(qualifyingItemType: .apple, minimumItemCount: 2, priceMultiplier: 0.5)]
        let uut = ShoppingCart(discounts: discounts)
        XCTAssert(uut.items.count == 0, "Expected to init ShoppingCart with no items")
        XCTAssert(uut.discounts.count == discounts.count, "Expected to init ShoppingCart with \(discounts.count) discounts")
    }
    
    func testInitCartWithItemsAndDiscounts() {
        let items: [ScannedItem] = [.apple, .orange]
        let discounts = [DiscountOffer(qualifyingItemType: .apple, minimumItemCount: 2, priceMultiplier: 0.5)]
        let uut = ShoppingCart(items: items, discounts: discounts)
        XCTAssert(uut.items.count == items.count, "Expected to init ShoppingCart with \(items.count) items")
        XCTAssert(uut.discounts.count == discounts.count, "Expected to init ShoppingCart with \(discounts.count) discounts")
    }

    func testCartSubtotal() {
        let testCases: [(items: [ScannedItem], expectedPrice: Double)] = [
            (items: [.apple], expectedPrice: 0.6),
            (items: [.orange], expectedPrice: 0.25),
            (items: [.apple, .orange], expectedPrice: 0.85),
            (items: [.apple, .orange, .apple, .orange], expectedPrice: 1.7)
        ]
        
        for testCase in testCases {
            let uut = ShoppingCart(items: testCase.items)
            XCTAssert(uut.subtotal == testCase.expectedPrice, "Expected subtotal: \(testCase.expectedPrice), found: \(uut.subtotal)")
        }
    }
    
    func testCartWithDiscountOffer() {
        let items: [ScannedItem] = [.apple, .orange, .apple, .orange]
        let expectedSubtotal = 1.7
        let expectedTotal = 1.1
        let offer = DiscountOffer(qualifyingItemType: .apple, minimumItemCount: 2, priceMultiplier: 0.5)
        let uut = ShoppingCart(items: items)
        XCTAssert(uut.subtotal == uut.total && uut.total == expectedSubtotal, "Expected cart subtotal to equal cart total before discounts have been applied")
        
        uut.apply(offer: offer)
        XCTAssert(uut.subtotal == expectedSubtotal && uut.total == expectedTotal, "Expected cart total to change now discounts have been applied")
    }
    
    func testCartWithMultipleDiscounts() {
        let items: [ScannedItem] = [.apple, .orange, .apple, .orange, .orange]
        let expectedSubtotal = 1.95
        let expectedTotal = 1.1
        let offer1 = DiscountOffer(qualifyingItemType: .apple, minimumItemCount: 2, priceMultiplier: 0.5)
        let offer2 = DiscountOffer(qualifyingItemType: .orange, minimumItemCount: 3, priceMultiplier: 2/3)
        let uut = ShoppingCart(items: items)
        XCTAssert(uut.subtotal == uut.total && uut.total == expectedSubtotal, "Expected cart subtotal to equal cart total before discounts have been applied")
        
        uut.apply(offer: offer1)
        uut.apply(offer: offer2)
        XCTAssert(uut.subtotal == expectedSubtotal && uut.total == expectedTotal, "Expected cart total to change now discounts have been applied")
    }
    
    func testCartWithDiscountWithoutQualifiyingItems() {
        let items: [ScannedItem] = [.orange, .orange]
        let expectedSubtotal = 0.5

        let offer1 = DiscountOffer(qualifyingItemType: .apple, minimumItemCount: 2, priceMultiplier: 0.5)
        let uut = ShoppingCart(items: items)
        
        uut.apply(offer: offer1)
        XCTAssert(uut.subtotal == uut.total && uut.total == expectedSubtotal, "Expected cart subtotal to equal cart total as no matching discounts have been applied")
        
        let offer2 = DiscountOffer(qualifyingItemType: .orange, minimumItemCount: 3, priceMultiplier: 2/3)
        uut.apply(offer: offer2)
        XCTAssert(uut.subtotal == uut.total && uut.total == expectedSubtotal, "Expected cart subtotal to equal cart total as no matching discounts have been applied")
        
    }
    
}
