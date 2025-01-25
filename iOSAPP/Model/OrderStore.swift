//
//  OrderStore.swift
//  iOSAPP
//
//  Created by Royal K on 2025-01-25.
//

import Foundation

struct OrderDay: Identifiable {
    let id = UUID()
    let date: Date
    var orders: [String] = []
}

//extension Date {
  //  func isSameDay(as otherDate: Date) -> Bool {
    //    let calendar = Calendar.current
      //  return calendar.isDate(self, inSameDayAs: otherDate)
   // }
//}

class OrderStore: ObservableObject {
    @Published var orderDays: [OrderDay] = []

    init() {
        #if DEBUG
        createDevData()
        #endif
    }

    func addOrder(_ orderName: String) {
        let today = Date()

        // Ensure 'orderDays' is an array of 'OrderDay'
        if !orderDays.isEmpty, today.isSameDay(as: orderDays[0].date) {
            print("Adding \(orderName)")
            orderDays[0].orders.append(orderName)
        } else {
            orderDays.insert(
                OrderDay(date: today, orders: [orderName]),
                at: 0
            )
        }
    }


    private func createDevData() {
        let sampleOrders = ["Latte - Medium", "Americano - Large"]
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())!

        orderDays = [
            OrderDay(date: Date(), orders: sampleOrders),
            OrderDay(date: yesterday, orders: ["Espresso - Small"])
        ]
    }
}
