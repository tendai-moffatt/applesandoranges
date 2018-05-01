//
//  ScannedItem.swift
//  Checkout
//
//  Created by Tendai Moffatt on 01/05/2018.
//  Copyright © 2018 Tendai Moffatt. All rights reserved.
//

import Foundation

enum ScannedItem: String {
    case apple
    case orange
    
    var price: Decimal {
        switch self {
        case .apple:
            return 0.6
        case .orange:
            return 0.25
        }
    }
}
