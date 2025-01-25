//
//  Order.swift
//  iOSAPP
//
//  Created by Royal K on 2025-01-25.
//

import Foundation

struct Order {
    let coffeeType: String
    let size: String

    enum CoffeeEnum: String {
        case latte = "Latte"
        case cappuccino = "Cappuccino"
        case americano = "Americano"
        case espresso = "Espresso"
    }

    enum SizeEnum: String {
        case small = "Small"
        case medium = "Medium"
        case large = "Large"
    }
}

extension Order {
    static let sampleOrders = [
        Order(coffeeType: CoffeeEnum.latte.rawValue, size: SizeEnum.medium.rawValue),
        Order(coffeeType: CoffeeEnum.cappuccino.rawValue, size: SizeEnum.large.rawValue),
        Order(coffeeType: CoffeeEnum.espresso.rawValue, size: SizeEnum.small.rawValue),
    ]
}
