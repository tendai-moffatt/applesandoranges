//
//  ShoppingCart.swift
//  Checkout
//
//  Created by Tendai Moffatt on 01/05/2018.
//  Copyright © 2018 Tendai Moffatt. All rights reserved.
//

import Foundation

class ShoppingCart: NSObject {
    
    var items: [ScannedItem]
    var discounts: [DiscountOffer]
    var subtotal: Double {
        return items.reduce(0, { return $0 + $1.price })
    }
    var total: Double {
        var cartTotal = subtotal
        for discount in discounts {
            let qualifyingItems = items.filter({ $0 == discount.qualifyingItemType })
            let matchCount = qualifyingItems.count - (qualifyingItems.count % discount.minimumItemCount)
            let discount = Double(matchCount) * discount.qualifyingItemType.price * discount.priceMultiplier
            cartTotal -= discount
        }
        return cartTotal
    }
    
    override init() {
        self.items = [ScannedItem]()
        self.discounts = [DiscountOffer]()
    }
    
    init(items: [ScannedItem]? = nil, discounts: [DiscountOffer]? = nil) {
        self.items = items ?? [ScannedItem]()
        self.discounts = discounts ?? [DiscountOffer]()
    }
    
    func apply(offer: DiscountOffer) {
        discounts.append(offer)
    }
}
