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
    var subtotal: Double {
        return items.reduce(0, { return $0 + $1.price })
    }
    
    override init() {
        self.items = [ScannedItem]()
    }
    
    init(items: [ScannedItem]) {
        self.items = items
    }
}
