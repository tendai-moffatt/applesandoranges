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
    
    override init() {
        self.items = [ScannedItem]()
    }
    
    init(items: [ScannedItem]) {
        self.items = items
    }
}
