//
//  ViewController.swift
//  Checkout
//
//  Created by Tendai Moffatt on 01/05/2018.
//  Copyright © 2018 Tendai Moffatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let input = ["apple", "orange", "apple", "orange"]
        let items = input.flatMap({ ScannedItem(rawValue: $0) })
        let appleOffer = DiscountOffer(qualifyingItemType: .apple, minimumItemCount: 2, priceMultiplier: 0.5)
        let cart = ShoppingCart(items: items, discounts: [appleOffer])
        print(cart.total)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

