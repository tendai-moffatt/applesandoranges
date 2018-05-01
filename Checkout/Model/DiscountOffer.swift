//
//  DiscountOffer.swift
//  Checkout
//
//  Created by Tendai Moffatt on 01/05/2018.
//  Copyright © 2018 Tendai Moffatt. All rights reserved.
//

import Foundation

struct DiscountOffer {
    // Item type the discount will be applied to
    let qualifyingItemType: ScannedItem
    
    // The minimum number of qualifying items needed to trigger offer
    let minimumItemCount: Int
    
    // The discount's effect on the price
    // (e.g. 50% off = 0.5; 3 for 2 = 0.66)
    let priceMultiplier: Double
}
