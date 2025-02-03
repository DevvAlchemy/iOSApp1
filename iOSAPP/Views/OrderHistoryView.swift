//
//  OrderView.swift
//  iOSAPP
//
//  Created by Royal K on 2025-01-25.
//
import SwiftUI

struct OrderHistoryView: View {
    @EnvironmentObject var orderStore: OrderStore
    @Binding var showOrder: Bool

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action: { showOrder.toggle() }) {
                Image(systemName: "xmark.circle")
            }
            .font(.title)
            .padding()

            if let orderDays = orderStore.orderDays, !orderDays.isEmpty {
                Form {
                    ForEach(orderDays) { day in
                        Section(
                            header:
                                Text(day.date.formatted(as: "MMM d"))
                                .font(.headline)
                        ) {
                            Section(
                                header:
                                    Text(day.date.formatted(as: "MMM d"))
                                    .font(.headline)) {
                                        ForEach(day.orders, id: \.self) { order in
                                            Text(order)
                                        }
                                    }
                        }
                    }
                }
            }
        }
    }

    struct OrderView_Previews: PreviewProvider {
        static var previews: some View {
            OrderHistoryView(showOrder: .constant(true))
                .environmentObject(OrderStore())
        }
    }
}
